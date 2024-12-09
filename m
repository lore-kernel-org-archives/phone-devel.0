Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A5522488E
	for <phone-devel@vger.kernel.org>; Mon,  9 Dec 2024 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747506; cv=none; b=PyN2NPHRGSP9ZHyvwflgytg3+tXdArpVFHaCHhQmWLEGikgLk7io8DexnPzBSlNzPLf+MWdk+T9Bt9Obiy/lcdzriL0CyDG6nrjasGCQcwLz7yiW0ytqa0l0IIkk2dUQpsrizZ9u5j6qHpld1ILbZ4NmsrjLqIcXdVlA83Vb2vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747506; c=relaxed/simple;
	bh=V80SjHPuPJO8bSs01xLSVvviPHQRe3xlREYuVNCjDTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdP/1NkHyruJ1UyAvfrWpCnOPBECYT0FSz5elOMYa3tO3VjehDCf2qCFhpOvXqwrRIo1pTFIxZUrTumCCYSp9cvo2Yt/5JBVpp125WS4Pjbpc5Ruu+vxFUEWAEqXP5RbZbp2hZXaN1G2p7Cpre0OhiUgFm9I03nXgDOTfhMh56A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uXneIV2d; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uXneIV2d"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434f7f6179aso8825305e9.0
        for <phone-devel@vger.kernel.org>; Mon, 09 Dec 2024 04:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733747503; x=1734352303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRm4dCu0E7cXsbtrbvM4hFCJCIS666sOacEIJ9xl6i8=;
        b=uXneIV2dGRivAp7Kl0evKdeOGsyOXty+IUI68u0/3JBwKiwIhZc0sTPZV3xamCLKw4
         wv1n98/SBqlekq1aWIiOlJj6czPSToa0c5uQxMna3i1tE28cQo3eaFitvA48x32z/VZh
         dTDcMllB/P8I6c4qANC8uQe61Mn/TgFf1Oz7VLa/0Fd1tdtggc3LjJaAp/WQcy91RCti
         /WkQAESb6OVZwYXIB01EOY49o32N3u5L9sv2U+EOVPInxCrLH5sh/5CuKTwoRftzMtiX
         2dn1gC0lBD+KQ+KU0vq7UK7T+eBcLAcuuT/w1ckqWleIlUter1KVFH5EO9wz/dA6Ij29
         VGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747503; x=1734352303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRm4dCu0E7cXsbtrbvM4hFCJCIS666sOacEIJ9xl6i8=;
        b=YcO42WKXQbghWVg0cZrgM8nUMlu5bXBpzbQvLa/pmjhWao4+c6zDNKmH9kQGBUDBpV
         WdfDIGq3OhjVBxOz63rLGOlEIkEylPEElHJTOqYyVj9lpFNFoB6JRbedySekzdR2zgzb
         6zHa9FKdf9KPQtoT/P+C6pX+tU+YiGq6/OlixEIAf4jIaG5UTb8B6ZsE6yDsRW+kJ/LJ
         66HJXwuLarlDbWrDj0G3VL8Uym5VssZMMrh6Q/wk+ypOR/jv4gK51yL6z1vCyPhMIX8o
         /I+oSVxaZ0KYl28glEhSTl56lBUWSGJPUu45DZaKWGttixwiI3LDnzWIkFWokFXzAjKg
         qvSg==
X-Forwarded-Encrypted: i=1; AJvYcCVPgrOEG6qm1LjFnRV0s4SfcSxzPLN7kuJ+8F4DE8SeQ9U3wznAau7GSEn9PCa3S9Zw5hJiPLr2CoMwrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0lQxZwzwB9FzGIHa+XOg+UPxgVlM68/oZMqJ6p50+AwaSudwl
	by706ugBNds4Vjns5le/SLVYBPPLLLyKujdtzw/wh69scJc0c3jQbY01BwOKHGg=
X-Gm-Gg: ASbGnct29qovPjWZEjlkJjJ6C+kpdTRujYEYfQadVDNmegAQprxF28APksx8oGYdM8m
	Nr0NivJU/gZsqR9iBGyZyA+uFi3vgzFmU+2uNIgMhompE1FY2WevRwYsTTHZTSF4zNGnpd5GEfO
	4xowxcr+RIJNUlZH98v5yWxmlpGQwDBXbgUvkzS91bZbHFMsk/yAaRR22SI8OQPVEzAmlg0K7tx
	3FKT6hMW1Kxp408oc/6UnwjCKZii/jVtbMG96y0ye7ARZLzz8qzFBTzHYQGbw4=
X-Google-Smtp-Source: AGHT+IFHlcD0QtIEHzo///TA1PUBPADs3i2ARH6b+sxPvGLyLn4BKFeZx45Adz8G8Ryx2Tb0ZV7MMg==
X-Received: by 2002:a05:600c:198d:b0:434:ffe3:bc7d with SMTP id 5b1f17b1804b1-434ffe3bf49mr3564495e9.16.1733747501338;
        Mon, 09 Dec 2024 04:31:41 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f44eaac7sm53453685e9.42.2024.12.09.04.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:31:40 -0800 (PST)
Message-ID: <8256c4f4-971d-4228-a660-5daca42281d1@linaro.org>
Date: Mon, 9 Dec 2024 12:31:39 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: media: camss: Restrict bus-type
 property
To: Luca Weiss <luca.weiss@fairphone.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Barnabas Czeman <barnabas.czeman@mainlining.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, David Heidelberg <david@ixit.cz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <20241209-camss-dphy-v1-1-5f1b6f25ed92@fairphone.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241209-camss-dphy-v1-1-5f1b6f25ed92@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2024 12:01, Luca Weiss wrote:
> The CSIPHY of Qualcomm SoCs support both D-PHY and C-PHY standards for
> CSI-2, but not any others so restrict the bus-type property describing
> this to the supported values.
> 
> The only exception here is MSM8916 which only supports D-PHY. C-PHY was
> introduced with newer SoCs.
> 
> Do note, that currently the Linux driver only supports D-PHY.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
