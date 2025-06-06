Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627C028688A
	for <phone-devel@vger.kernel.org>; Fri,  6 Jun 2025 10:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207589; cv=none; b=K53NcgUHkjWyg4yQgJCCHrMJwrPIbTVOpWITOhHA6GwukXNhd1zu2oExWrDrCAlB2tc4upBCMe87TNNYl7zpIMZoDSjiyNYqSPEnPXlbahqrZekQhQtmkCJyNbXu9kDEDkq+ijJeONrBOj3JZPmC18hH8Z2NP03Ix/1+xANHHN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207589; c=relaxed/simple;
	bh=eNvJDVx2RVD1ON1QjqqCkfACmTkFJYvAfRFH/oO/c8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKxm7S9z5CnH/1wijqI2KVsKRTyTwHmhfWKX1C87QVzHd7YkvTkIWZx9XnckPTXmibEE3BOnRMjqmHKEaohrumJwvvyC4xmGyC2zOmYpeLa+59IWQHfC0P0/prWankQIEZDjN9USvFDJOBeQHefgskeRU9NJ/D3xTXgqHE9h+1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y7HvIGO6; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y7HvIGO6"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5532bc4501aso193347e87.0
        for <phone-devel@vger.kernel.org>; Fri, 06 Jun 2025 03:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749207584; x=1749812384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvqW3AWqkK+q0nQJutHUZ9u8mAXK0/731ZCrAoRGHHE=;
        b=y7HvIGO6Qgb8Jd6cOhGPeEheZl0oTWJsquM7T8v1Pt4XRmNmpQzdBIKhcEGqV3RoRb
         JzFKHSYxau83ee0ZkqjtQbQVm2lMOV5CH0r9qb0RaiakGI5CZvlGJANB/fgoswf5hPB6
         VeHtydAr20LUS7q5LSYkezfHF2DCpH5h/5TglbOrd/BV0sTKZOk+1dpWjR2alnTmL039
         idYPqOFYnwox9Nm7YaToTgDOwTTz5xf2gZo39GIL+oloHCNX0RrUsnx81FT5t5N5RCx0
         2MfW2bBWTz0yNH4i5h9KIeYaxrq7qOczOk5bcXd+pd/roKChu/bG3NPMKw34oDIeWur5
         3bIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749207584; x=1749812384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvqW3AWqkK+q0nQJutHUZ9u8mAXK0/731ZCrAoRGHHE=;
        b=owiy0IQNPEY8VFq2CqowSQlcnUjiPY2V9V7TXsUYuH5Yr3xNstHn4SbheBo+j3xOpx
         rlcQNUWk1/N0YzcOm602L5z6WzoC+v0PtzojYYpRPAlV3JHvDhjais33XV5LaLOOEweK
         s4+dusfoH+Hb/0ZmvoHuj1HcVoUVp45jh5uYYnb+HwTJPPG2bzs7TZf+x02RtiWBEcz0
         sdsDtmgj9o73NyQKvdAfMQe6sJdBA9IvobtSXjJhR8WHt5uC3QjA3hoyScrsP/vEX46+
         CsS6Wp/KW/HrYL1PNH/wnY8DvLyJ/F+h3vn4QvfiatxqbpPDnCJlC8dnzasJh6zBckxu
         LJOA==
X-Forwarded-Encrypted: i=1; AJvYcCVuIH7mx7D9VUt6Wxcsj7zk9cu4OeEjXlxphyraa9/Ea1Lw3IREo2e9W6OUP9WktivMhNYhlP7V5kSlHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhlBUlmwXqasJykSsPQYnRIL1nkK7hAlTSHBP5w5x2b7YWlvGS
	7wbBpSbBqJfvrW8ehpPjI3penGLJqXG0rreliTL6yHidH2dv7CT+lK/ppNQ69d1T1MU=
X-Gm-Gg: ASbGncsqeC5HVYoPC6jDsd3Avc6oiyeSxGDe7iEp2dgXhsNDeQ/l1o+D8Ty6Dmj0+2X
	gHvE+jW4OBuiIO70kwGRz5Ijea2yqaNFop4scbGgdVJ42E1lRZO5bhaXTzN4AYqiLLxN293IuMm
	D46+AYeyG9rX0OO35SFpqPe1PZOOUuVYA7dNzFRrFSOBoYBfnnx4Gg1hl0us+I6JvcKqCwxc5je
	dtjOn7jJsnfGw5Wm5eyRFw0xky+M5hHCE8c/4b2JN7ljHiMIsVriK5ML7jsN4J6JlBJcaEowMUU
	QeCrFrp8cEH4gK51+Ka0UmP4sS/alMKsxsEU4vZbDZQqTDfwwCYZNk/U/BKbD/KZe0iFNM1EbxU
	YhOld44TJCChrib5n0brwBKQvr7RaEUVKEu61okAy
X-Google-Smtp-Source: AGHT+IF6VGZzfzzaonioCVFuOZMDtflg4UEsDYktUq+bINrW6ckDf4AUU0LdM6+SSpNaHgJWBn5jVg==
X-Received: by 2002:a05:6512:401e:b0:54d:6dd3:614e with SMTP id 2adb3069b0e04-55366bd41d7mr243196e87.1.1749207584314;
        Fri, 06 Jun 2025 03:59:44 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367731877sm151482e87.223.2025.06.06.03.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 03:59:42 -0700 (PDT)
Message-ID: <877a72fa-cdae-4a66-9991-5ea86ef76aac@linaro.org>
Date: Fri, 6 Jun 2025 13:59:41 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: qcom: camss: Add support for MSM8939
Content-Language: ru-RU
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
 <20250602-camss-8x39-vbif-v4-2-32c277d8f9bf@mailoo.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250602-camss-8x39-vbif-v4-2-32c277d8f9bf@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Vincent.

On 6/2/25 20:27, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> The camera subsystem for the MSM8939 is the same as MSM8916 except with
> 3 CSID instead of 2, and some higher clock rates.
> 
> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
> This fixes black stripes across sensor and garbage in CSID TPG outputs.
> 
> Add support for the MSM8939 camera subsystem.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

There was a preceding and partially reviewed changeset published on
linux-media [1] before v1 of the MSM8939 platform support in CAMSS,
due to a merge conflict this platform changeset should be rebased IMHO.

[1] https://lore.kernel.org/all/20250513142353.2572563-4-vladimir.zapolskiy@linaro.org/

--
Best wishes,
Vladimir
