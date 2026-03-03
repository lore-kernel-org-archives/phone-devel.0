Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190F7395261
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532657; cv=none; b=ANiBYYez7XY22p5K0F3jXoVlfdj7ZmTGeWvsHyAgRbZbeai1mGoUlUt9rbo6rbOqYV7KHTn9SAUmD7VCNQBx4ZX7HKRMx4T68NQt9vwK9Tg9NWPiqU8EIHpc3yevpuuneSVXnQO/Z03Ad6BgBWwbduplWJG4poFfSlR6US37ToE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532657; c=relaxed/simple;
	bh=aWHfGub3SJAxwp4p/JOo82XFq9ePDdQb1rlP4WEeGSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4hC4ZYObPQr4ILEfaPR6eAu5C5CDacqcaO/ImA4M/bvTwifR+Qe0SgHHuAQaOacVuq5LIgymYPSdYHcR98K41YWAi72nQN3YOevzmxu/I1eeDTlrdNfIpliUmH8hzQBVaULJcH/eBBN9lA4Fzw//kCkGWvDYOGRmD2U8YK7RjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vNso/GQv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNso/GQv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so36459355e9.3
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 02:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772532654; x=1773137454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aWHfGub3SJAxwp4p/JOo82XFq9ePDdQb1rlP4WEeGSM=;
        b=vNso/GQvbw1Qc3YrZADsKVb+ICxctDPnipZpH66rx+o3xn34w16kxIaWh/6DZbjpVO
         zVGVPTiVMFw/5iswaZpdeTq8vKWZbZI+bnGs5cYkb3G+MPVlUcND5+JVmetLtiiothST
         9k8++4ax0N2IuUc4FrQaC060jmDM3HIw0MRx1T8OcdxcRToQk41dNUK9C068rugXjb1S
         g75m8S1QLzvFOTptuj1d6WMDAte22dBSN4nc35ms2Hbe2yazrG81E6UnFM6PPEmNhvnc
         kX0NJoJ1UDE9ukFMa1i22ER3TaTDkvbEWUjtvSgkrzF3yBifbcDnTJblfNm2p1XSRjN+
         AH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532654; x=1773137454;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWHfGub3SJAxwp4p/JOo82XFq9ePDdQb1rlP4WEeGSM=;
        b=TAsGNMCR4bA3SaTtBOB51/dTANRz4LateqVnbDTIDcPlhNtbj2b4s2McbGLspuoCIH
         8zQupRroAMML1H1zQqEqxt5nDKXizVeWnXP41NkysNEPt6VCDijQmRP+GP4Lia7W/0N/
         QY+re5DNmaclsPuxwnXAoYbKuP1g+xtsSs3OI9VMf0c7qIFQTNVI4Koqv0xWOHpzpSCt
         CHqDkS2XzZzvFKMM8VW38rN8sfG0oJepZp+cYlODBWcEwma0SC2WAIWo0g9C3CX+GI52
         ZMGJY/+vyq0+i7PUgq02f5cYWFPMBnuOKncSwKw0kKU4KU44e0oM4mAsvXj/7TKljjfb
         ojrA==
X-Forwarded-Encrypted: i=1; AJvYcCVYaxeCKAOUeLBIBjcJc+Xa9rSOBvhpDb7pfajPzDt/oOODLO02iShpqT66NZwrvIu0cS3wIWZrs7TE7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCTf6LPIucyLuQ77F2gIZePrjmMaW1KtKknygIYMJaGZrNLYMv
	Dcofaasu/mG6jllmieOGO2opPR52PMNLFGkC2R1S8QHtDX7q9Bavd0uIMdiA3GPHWFU=
X-Gm-Gg: ATEYQzzJADf7WyVkqVuP86WF9S14OdUDG8XfVwPo9wN6MKmkf49RzPM0grYPBabPipH
	QuT2HXH0AcZV2+a/DF1lEwFwOPDy52D4FXVxZklaf18Wykx6ynyEhAc539HXubtaJxC2czYy4co
	JfOVGspNuC09JSOQ7OjFULtqlWnUIQewJSa5p8PmHRSbF7Kapft7yv6p1YsE8nIDiUyXp50ZEYB
	69aXI6rVQyLdRZZAObLht4U7/2+MFicpuu+QJBFAI29mlhdzLzfEPFrCoKvtkOQgm+UIjga2q47
	/zyU9x0HV9Zjd/acoHeppB5zp2/xOciNyachjdk2qPTg5HgRZup/Fw1a1AdXrhMa0r14XgW34Uf
	1jbOkqkIRx+wHXCCSIKowfCq1vdl458kgrP7t9rFdO+UAhN8U+WHdUaoUk9g3xR8fqNvIETlvqe
	isiRKZMU6B76ThV2eXK4gDqoZvlttxOf9rRA+IiPmMuSXQOjNDgDILCertSaH28XS9
X-Received: by 2002:a05:600c:674f:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-483c9bde826mr257845395e9.18.1772532654385;
        Tue, 03 Mar 2026 02:10:54 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3471asm357860255e9.3.2026.03.03.02.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:10:53 -0800 (PST)
Message-ID: <fcc67018-0320-48d8-b492-53245fdf6968@linaro.org>
Date: Tue, 3 Mar 2026 10:10:52 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 4/9] media: qcom: camss: Initialize lanes after
 lane configuration is available
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
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
 <200485c3-6f6b-4c92-a631-b5fcf3dfe1b8@linaro.org>
 <c6e77d44-f6ab-4207-b6bd-16f646a44f35@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <c6e77d44-f6ab-4207-b6bd-16f646a44f35@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2026 10:06, David Heidelberg wrote:
> "Move the lane initialization to csiphy_lanes_enable which is
> entered at later stage where the configuration structures are available."

I'm being pedantic sorry.

"Move the lane initialization to csiphy_lanes_enable which is
called when the configuration structures are available."

Actually I think config is called when/if the sensor gets probed.

---
bod
