javascript:(() => {
  const iframe = document.createElement('iframe');
  iframe.style = `
    position: fixed;
    z-index: 9999;
    top: 10px;
    left: calc(50% - 200px);

    width: 400px;
    height: 300px;

    background-color: #fff;
  `;
  const labelNames = ['read', 'watched', 'listened_to'];
  const ratings = [1, 2, 3, 4, 5];
  const rows = ratings.map((rating) => {
    const columns = labelNames.map((labelName) => `
      <td><button>&${labelName}[${rating}/${ratings.length}]</button></td>
    `);

    return `<tr>${columns.join('')}</tr>`;
  });
  iframe.srcdoc = `
    <style>
      html { box-sizing: border-box; }
      *, *:before, *:after { box-sizing: inherit; }
      body { text-align: center; padding: 1em; }
      .error { padding: 1em; background-color: #ffb8b8; }
      table { width: 100%; margin-bottom: 1em; }
      textarea { width: 100%; height: 4em; padding: 1em; }
    </style>
    <table>${rows.join('')}</table>
    <button data-close>Close</button>
  `;
  const onRate = async (label) => {
    const value = `${label}: ${document.title}\n${location.href}\n`;

    try {
      await navigator.clipboard.writeText(value);
      iframe.remove();
    } catch (error) {
      const div = document.createElement('div');
      div.className = 'error';
      div.textContent = String(error);
      iframe.contentDocument.body.appendChild(div);
      const textarea = document.createElement('textarea');
      textarea.textContent = value;
      iframe.contentDocument.body.appendChild(textarea);
      textarea.select();
    }
  };
  document.body.appendChild(iframe);
  iframe.onload = () => {
    iframe.contentDocument.body.addEventListener('click', (event) => {
      if ('close' in event.target.dataset) {
        iframe.remove();
        return;
      }
      if (event.target.nodeName === 'BUTTON') {
        onRate(event.target.textContent);
      }
    });
  };
})();
