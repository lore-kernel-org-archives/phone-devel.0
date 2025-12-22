Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776DC30FF37
	for <phone-devel@vger.kernel.org>; Mon, 22 Dec 2025 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418420; cv=none; b=axlBBOTGVASdKWSXuq1DsBJJhpf5W+Ca/1g5J5MADUaCLyy9vzuNFfsQjkytNDuL//6CTseuthUQeEuQ10Jnc+M75FBq5sLTrZGG4zHopzgKh589aDUj+VLesZDSNZ6ho3ESApZf7EvBdMq4SjL23YsAuJAjxN0QaZfHTuxdrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418420; c=relaxed/simple;
	bh=GGjaLoQhCp+2no7ekK/HLa/7i2pLriK1t4fSCLCjjzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nj1oW9b9plE0KdQC2H7MXEO6lh5YGwYJIJBR8owhr8uYu0CJgoUmW/p5x+Sk0HnSxu9kmOol4A3pG2EkG9hzP2TwZYyj4jqdhw7u8JcWYw/lQ6l4UUT6ujAjAXN4hAcV7GYHTABWkmwtiHPIG1NYWh3mtt/cv8z6BUQSGEPM01Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ko3Kyb5m; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ko3Kyb5m"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37baf2d159bso8464611fa.3
        for <phone-devel@vger.kernel.org>; Mon, 22 Dec 2025 07:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766418416; x=1767023216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQA+t0BLvG8fOA4teeYPO1i6EIFLXHkisNI387Ij+Uo=;
        b=ko3Kyb5m0Ss76GDJyfVKtsUmcbNMT8ItM0jKcunFuyqjbaGugONCnKTIkS70OyPigE
         K4Jnao9v0TQJ5S+eSrxn8kExEaiONiaZXXenXkpS88QHZU5bxVCC+NOp4T31DQ7RB9A/
         eoGn/yfK4czxjDphq9NblT4luj3je2OZqIKbZ9B5LgdAu2y1xRh+aoJ00AjHWxWe9+uq
         ncDjZyKDber9PLqtj1JFexJ55b9QST1z8ja4rFwA05vH5qNod/yPUpMKOfLsyUO34lnv
         S+sY8jn1Ss/ZTrMVvD1sJxgWStytw7ax29V+UZZ/IuBsfsajoIkNS+DtYtRzEiBfQuwK
         plig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766418416; x=1767023216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQA+t0BLvG8fOA4teeYPO1i6EIFLXHkisNI387Ij+Uo=;
        b=m5fAuN7TE3bQZ8cmWEKgnZ445Wj7Qc4sPm6G1S+AftySYsT5oh/pzgmFzwsv8X9Y6y
         ut6kSaFSFzMFx9Lt7z62eJ9hhEpULTDLmlypbeoWvWy2SWnjO74Rvy9UhYqT6yGDjl1+
         +bDjNgPpqj0PQ7oQwcBYxMc3uq0eOrRtFPUI7h7MgVPZBWtkXSLOhw6NoAB6rarlhmBC
         0k7J+BH7PcgYlLjhRoA6l1vb2D0MPNkHGjMqGx3A2FMiW6gWf2q1r/7kr3hwyvp5fGYQ
         tZvw8/vTjneNoKuBJjFbjDmhKyOrh6/XVTvp5wf0b4wJNyyU+doC7jAhPnCOOVZHD3lS
         rT9g==
X-Forwarded-Encrypted: i=1; AJvYcCUcjC6QnwLm7KJYGMezUF/zf4PmdMgOptXyRK0Z/XBMaUpZ2aK+lZsz5HQ5glJiZn6vN0OSOSyDXdItjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcFlVSM71/yvWrz9MePgkJWUlC50dLeF8bPaBin1gkMsmfT3cB
	/yZ+J0sl72J3LX8KXD6R4RQPtIgo+UPA36aEDFgwRQ1YOUzRpZut715kSzjic6N5+ZQ=
X-Gm-Gg: AY/fxX7tKceFr+GkmvQqL2+nxM4lEWPPh8iQohAIeVBQfQj8CfO/dGfmWPPAoEDvVG3
	3J6DCcfZ5TDNFUBqaEfetFG3rWYmKK4rbSgZ51XzccbGNsVBakoMKN47oEU6fzPBrg2408GBQeV
	ONVLFGO5Yx1BnN2d58n9zymQlGXXRD36Q7m29uar7dxyyemZC+uaisSsEr7gkWNLqRu0JJnR+ys
	CS4VRv7agaODigqGYLnyRdVtlt1FrwEmyR9D04ZrF7ajvvrjy2dCVYNshtlO3UQcwuLglEaosZO
	x2N9YcaduOq6k1sWCpyUIH58JttTQ9X7QJrB2LjZu+WF7oeCZGdQ/6lQeWpAajhsdCeHcX53Ed+
	NVj+9NISs7im29s0PZ4rthgi71zGti+P+KYDma8hBESxaB1zAWqF/FltzDxq5jEXbl/1oi7Hb+4
	aYwBHxH2xlvnLEs+E1fiUbPdAqZCFxiZKB7HBxSNvRGrbnCULqmAihF/ecKDN2fz/4WA==
X-Google-Smtp-Source: AGHT+IFQx5aNaZttip8OpGBoWMCmObEm/k41TzjlVuJvY0HKmyBGQ4yTX7ngXbHyytCtqPSY3zkLCQ==
X-Received: by 2002:a05:6512:61a1:b0:59a:11b8:88a7 with SMTP id 2adb3069b0e04-59a17d073c6mr2364604e87.1.1766418416446;
        Mon, 22 Dec 2025 07:46:56 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5cbesm3367729e87.13.2025.12.22.07.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:46:55 -0800 (PST)
Message-ID: <d135e715-8949-4348-bf3f-cff01911c988@linaro.org>
Date: Mon, 22 Dec 2025 17:46:53 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: dt-bindings: Correct camss supply description
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Richard Acayan <mailingradian@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251222-docs-camss-fixes-v4-1-914a4e5f7822@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251222-docs-camss-fixes-v4-1-914a4e5f7822@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/25 16:16, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Usually, the supply is around 1.2 V, not 1.8 V, and also correct wording.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Eventually, if more changes would be requested, would make sense someone
> from Qualcomm to follow-up on these, as I don't have schematics,
> documentation or also no access to the internal resources.
> 
> Thank you

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
