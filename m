Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137932ECE9F
	for <phone-devel@vger.kernel.org>; Sun,  9 Nov 2025 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762692600; cv=none; b=t1YHcn1q4xvoaqgtMKEA/NjQ9roTlcE3zSN2OKOgi6J1wc3uAQAYjJKgQFMEE2i9KQlMzZaZ9Tm6FFVJeVNdx2UxpQCzuU3si8UcmheB13jbBG0QHFPImyyNsxLCdgtMvcZxfSlKT3H7nhw0Pvln9hvZ7Bdoqb1v9zKlSog9QkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762692600; c=relaxed/simple;
	bh=RWsh0MNVHHOeT+2llJsTwxoFnM5p6UnPIPtoFkDeVgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+SOpDEGr+7F21jkX9BuQozKbpromABKsrgs/hiv9W+hDNumMPsgBcAoI7A49lU872oN4oZO+7dtxv8A/pCxbrajqvStu8Er3KpoRk6CZ2llwND1GaA5t/ELZWJ40V3NHjqg2cTs39W6hZqX6rUQ9BUk/6Q0es2lqakaM5vzg2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mM+BddcS; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mM+BddcS"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so3125821a12.3
        for <phone-devel@vger.kernel.org>; Sun, 09 Nov 2025 04:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762692597; x=1763297397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b3uCPMdMXg41Vg12Apli3BT+126wRXMTBjult076Xbo=;
        b=mM+BddcSrPO4Ff3Lxyd4Awuwj0dTiUnDLqiFoUqaFWTzSBZCtkQg9W5WOo/cSrzDlE
         io8ZKsjLtfXqvlHfZuY90IYMn6nNmcjv/cWT8ErAW4fmkqFVMmRSZ+y5itJUU3Jle2t4
         PCmdXXjRIyC1RoCe9eWSuoFTayWUadJY5rrjSoh5tMLLj6wd6I1vYk4FDleM6J6MrVBL
         w0qhAmEGukwif5uqjcnzAJigPcpXK68zz1V6Xxb5T6yLdJ1N22kUlXfudmgOquipi8Yw
         2fd2Ipsr37h2tvI0IuoGWOdMrhJUri4N2TvG3bzrg1g4v5PQzBVvN5BS6asHi2BEj6RD
         UEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762692597; x=1763297397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3uCPMdMXg41Vg12Apli3BT+126wRXMTBjult076Xbo=;
        b=gBxfJbNw/fiIzj5GPHaSYdetkxEbwhtpLhkOOsliefXNjse5YRVtE1xCjQjuu0WBEt
         tIaA7fLQm16YmuNH9LHntSuKeTLEZvS58B/6ytlHyAIfM6VJSqs6hmkrselOlm54Zorm
         q8OuxLe2TVWMmgNMMx7xBwwK1UPxUxTwGDKkoQjG/sr5VklwZvKscvD4Dlp1aDjm0O0b
         2JZ80mVi8qMwsIBrN54tidE8n++qEANfdzOnKEFLzkZapTqXfZd2qpZhH51bcOyDbbeJ
         1Rvv6O/nGn/2dmDFnHEOlhlbpxXj69wvsmAHNs/6EORFLDHu0vqPUhFtkPG/I/oOPwlT
         SRaA==
X-Forwarded-Encrypted: i=1; AJvYcCUpN4ATMSFq2+Iw3X82RpUpL67IJucZVvuNluvx2F6Mn671JQ5oc5MlglQU1FlvGtIz/3YIbxH7v3ft5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz378tluWW5naCnxAnO83ZHQVLIt/FT1P2N6R5HYDqpI+iyGdc
	98Yc2gGE8uZrhdvCQHtFmQ12Sp4OYBfkeD1sY00BrVmI4m69LVZoJbyIr8Q6re3LWbS+MGYT48C
	wl8NYAB0=
X-Gm-Gg: ASbGncvTftHi0HzIHdnco9IEXg53F4r9lNNLdQ8U1BU1rLZJQ9w3H/f5AvVCUQ+LnnY
	ufvH3KYis6inAwWYMr2rf/YFQjnmOzNZP8BCAzH+caefknC7qcxQL6hPX8jYynnjf77gMw7ESPK
	9C09VY4uc+IBXbD5JwulaFdx6tNtvXKD1t7As35kPztWv0u8ZyOZNr9P2X7OrYuFpOOy/R2uZbj
	xuIR1XHcPKd+IGaS3YcWgYEvCXXK7X5AlBqkudCIyeEnvgRgR2hMzrnrWLNy/SEN5CCO+BbQI8b
	eYDIO15uTBmHECbcT8iGwZYzk9eqwFLCl0lKqnNUpn6CPkBM5o+wAFEU2qMwANzJzp/Ah9tS12i
	Vfc3oYdwHhhz3Mat3ZDAwBc+qiSaLVBpBvE9B1S9RnCzMqdt7dZWvMh4EB1O/umodbGJtGOcNQy
	twUndYeq4MbORC3I34lucz++oxTNtzhxG6a7BmasWborckGoIVjuSWXGqs6N7VDLotp8zH27FCt
	JTdC23GMJDYSythufOUyNTlPZuOblvuvsJ2Rdi/yKPbmgk4JOxhgoRsrIngFQEWvr6STXX/fUDS
X-Google-Smtp-Source: AGHT+IHq3tipKWAq6loGNwoQe1tMCrBPSrk3SZF+kU2pkM50gqp5iIGyhpBDk7dlni6/awXeEtBrLA==
X-Received: by 2002:a05:6402:1474:b0:640:9b74:b448 with SMTP id 4fb4d7f45d1cf-6415e813d04mr3914452a12.30.1762692597394;
        Sun, 09 Nov 2025 04:49:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:3b8a:ea00:4729:b0ef:dcc4:b0b6? (2001-1c00-3b8a-ea00-4729-b0ef-dcc4-b0b6.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:4729:b0ef:dcc4:b0b6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6418b54a888sm611277a12.32.2025.11.09.04.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 04:49:56 -0800 (PST)
Message-ID: <0390ae7b-8f56-4ed3-a3f9-616e7c74adbd@linaro.org>
Date: Sun, 9 Nov 2025 13:49:56 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/8] media: camss: Add support for C-PHY configuration
 on Qualcomm platforms
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
Content-Language: en-US, en-GB
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

On 11/9/25 10:39, David Heidelberg via B4 Relay wrote:
> # Short summary
> 
> This patch series extends the Qualcomm CAMSS (Camera Subsystem),
> including CSID and CSIPHY components, to support C-PHY mode configuration.

Awesome to see this actually working after so much time and prior effort!
> 
> # Background and motivation
> 
> Modern smartphone cameras increasingly rely on MIPI C-PHY rather than D-PHY,
> thanks to its higher data throughput and signal efficiency. As a result,
> many OEMs adopt C-PHY interfaces for main (rear) cameras on Qualcomm-based
> devices.
> 
> Until now, mainline Linux lacked C-PHY configuration support for Qualcomm
> chipsets, preventing bring-up of primary camera sensors on several
> Snapdragon platforms. This series closes that gap.

I think it's worth being clearer here that this is only tested on 
SDM845, and will only work on sdm845 anyway because of the lane 
configuration.

Additionally, with Luca's explicit D-phy check removed, other platforms 
won't error out if someone tries to use c-phy without adding the lane 
configuration (and whatever other configuration might also be needed), 
so it might be worth adding a proper check for that.
> 
>   - Introduces C-PHY configuration support for the CAMSS driver stack,
>     covering both CSID and CSIPHY blocks.
>   - Successfully enables C-PHY operation on the Snapdragon 845 platform.
>   - Tested on OnePlus 6 and 6T phones running mainline Linux,
>     using the Sony IMX519 main camera sensor.
>   - The new configuration allows other chipsets versionsto enable C-PHY by
>     simply adding corresponding sensor driver support and csiphy
>     initialization data, following the example set for sdm845.
> 
> With this patch series, mainline Linux gains working C-PHY support for
> Snapdragon 845, paving the way for improved main camera functionality
> across many Qualcomm-based devices. The groundwork also simplifies
> future enablement efforts for additional SoCs and sensors.

woohoo!

Kind regards,
Casey (she/they)

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Casey Connolly (1):
>        media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI CSI-2 CPHY init
> 
> David Heidelberg (6):
>        media: qcom: camss: csiphy: Introduce C-PHY
>        media: qcom: camss: csiphy-3ph: Use odd bits for configuring C-PHY lanes
>        media: qcom: camss: Prepare CSID for C-PHY support
>        media: qcom: camss: csiphy-3ph: Use sdm845 C-PHY configuration sequence
>        media: qcom: camss: Account for C-PHY when calculating link frequency
>        media: qcom: camss: Remove D-PHY-only endpoint restriction
> 
> Petr Hodina (1):
>        media: qcom: camss: Initialize lanes after lane configuration is available
> 
>   .../media/platform/qcom/camss/camss-csid-gen2.c    |   1 +
>   drivers/media/platform/qcom/camss/camss-csid.c     |   3 +-
>   drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 165 ++++++++++++++++-----
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |   6 +-
>   drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
>   drivers/media/platform/qcom/camss/camss.c          |  24 ++-
>   drivers/media/platform/qcom/camss/camss.h          |   2 +-
>   8 files changed, 146 insertions(+), 58 deletions(-)
> ---
> base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
> change-id: 20251109-qcom-cphy-bb8cbda1c644
> 
> Best regards,

