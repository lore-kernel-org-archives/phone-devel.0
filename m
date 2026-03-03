Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8975375ADF
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531671; cv=none; b=T2lAkM+UmFUIQ4k3x+RxgDxZx6RZetsnkTkKUO7BtjYMsWpcFElALUQWIORKB+GG5cFEls4DfVRMHWVpdx6YyAe9PaYkJ4qpyCMlzxLcVtOsuSeFUir40HhF2pPASiEUb/vHW/X1EskRhge237fp9Nr5pyHuFc2Bc9FZiH6WCFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531671; c=relaxed/simple;
	bh=leDnw+mECy7vi94Aqd8LcK/T7CGiXLcANMo2LYyAIEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8jO5XGaOZBb7sTyuWJzsRVCLT6YeKyrsdhJcm7B6WTIxSvZpP67GDF6/NPK7vN1PQOzolKfH9eceSWXQ+T8lcf9QNbNEasNfgjd9EskzZ6eI4J1Ss50KW+XfGp8vu6+TPsVS6LnDYq0AH2+5sHFob1Rttgr/Q3lSBYU/tigKvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zCqrT36t; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zCqrT36t"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9358bc9c50so576344766b.1
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 01:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531668; x=1773136468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27oC09m77hNLsnkhv1Pbx9jiMQy5tTJyTeXXhi6YTpc=;
        b=zCqrT36tL/fjCY1BXYwzIAAWClzk9SDYJGcYC9fV5tewRQcbIsYpqlLE52NQCYE6xL
         qhEvd4+pXYkNT/ByToBfa7tLq0L9asCuCuApovXMmxvBXijenTBmoaQ8E04kDrrJf7qp
         efxtVUdnj2D3rfcpDzZANVdo4frl3jhoBYAbYSgsHAn3uQuiDgXU6u+TdXr2s4bwx4zx
         Re/p/WUO2xWzxUmpAaUZASGFFzVccTZAEDOvPg9lzQcJB3iKS5kF8yjkuE4PgJ/tEkvq
         U6zRtRhrBTRQWajb+iKGf46tIyk7eiLCiat3ozTZbOGuMj1zx2jwoGZMe2JXnQhakrls
         No2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531668; x=1773136468;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27oC09m77hNLsnkhv1Pbx9jiMQy5tTJyTeXXhi6YTpc=;
        b=C/rmASGyZn6W9CD/wspisyQX/mk60rG74UP+vrI+FFEc74yeUZmmwBz9VyBhZLeO3j
         Jl18Y3BBA+90likbrZCmQRA8WmKcDgpU5cgbnzi82ygRnOZnT3cPfydbtzG+W7rExu6/
         OVuO0CE08EhCe84+Ko7BnU15JLHqDMnGIxi9aT4PUkQRacD6I3qY6dyTBMz8w1qloPFL
         3xXvQiUIZmQ/BhL9xPGdwc7QGRtZmYkhlqrxo64CN5Wu+nc3eO4VIiePb3h6QNs9Bh7H
         V/lu9ATqJZ3coEMaVxH4nDFxKAg2u+PPB/mdJ73c7JNHNKQPQCv6RpFHmaTcEK0hlSN0
         ZY0w==
X-Forwarded-Encrypted: i=1; AJvYcCWeCfp77/9cTjVzj8LIbwgbaXFVoBzHlbB5m9v0iN5/6QQbFCJSRBLEcC6ftRMrOZtu3MoTFX5V4Dkk5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkffhqrLbjR7SfIpMWs+hZnoeCRd+LPOxOMNJz614VNOtfHHJR
	u8NOxaDe1Pogu1oKRKccxPuGFZkNBOZ7oxo1eXz3jmXYzpRkXI3BLVqosJ0kqZGlzuY=
X-Gm-Gg: ATEYQzwnnSZ06KalAmyNd17mWcoF8AP7E/ur0PTzPxvx/8mn0/L/n8xcCHEfbuIKFcs
	RVGWjlX0K80omBemfGBYOH4nHjselJ6ZMN2ukSDZ7pZ2IdWv7shg3trSvebDS4ndjU78I6OYnn6
	d0wEZwK1R0cf316TZkp6S2bbxO9yAqLZtwC6MX7WS46yr+Cq5B+DGJJGQn7syh44KOPd6mtvNrh
	AqIAynWQy6wcy1oY7jNJX1eI8WufMpqY0W5Lj5+rhaVmGRYgN8zrLUy1W+t1nME94y3nRahgNah
	Gl6uR89pKY7VUDhPW0oIwZJLvXbVt8lr1fAL3pyJutGQou4RIKMQ4QM7n9fdYWL/hlxO/6h7Zcj
	IrIwutvHjO7jcHPzgKZL73+temuQYwKB+y29MYA9YLAO0nWY/OsVFMDwDeEAS5iBWi11HFoLKVq
	7QPPOQSA36I+B5eIJGYL+8bXR5VcRxekATII2ZxxBGfgTMwplC8AZDyz2NJDAC/GMZ
X-Received: by 2002:a17:906:9fc8:b0:b88:4c99:bc0e with SMTP id a640c23a62f3a-b93763d2329mr1003398866b.26.1772531668056;
        Tue, 03 Mar 2026 01:54:28 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae94441sm570860966b.50.2026.03.03.01.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:54:27 -0800 (PST)
Message-ID: <200485c3-6f6b-4c92-a631-b5fcf3dfe1b8@linaro.org>
Date: Tue, 3 Mar 2026 09:54:25 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 4/9] media: qcom: camss: Initialize lanes after
 lane configuration is available
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-4-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-4-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
>   Move the lane initialization to a later stage where the
> configuration structures are available.

You should specify which later phase in the commit log @ next rev.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
