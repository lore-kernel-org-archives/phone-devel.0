Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F926135A47
	for <phone-devel@vger.kernel.org>; Wed,  6 Mar 2024 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709742189; cv=none; b=bLkloUwEFJmcGXxYdjiFSc7u8JnCLlxi++cjhhIKG0NjH3U61Xb5tl7VYcRTgHNhqgA4WmegDKdg3oqDPJUcxCbC5qktK10BTnWMpEnJa+h9ReEuWbhVSAZJmfKCZb2S4OM1GueBMXHvfanBm042rgEOFclHRDVTbx8BnbfFpv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709742189; c=relaxed/simple;
	bh=afYBYeFEF4XjQ1hiQqHgb14ZhlaTYmEfuQA3UopgPDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5FZ6S9O9m3IhZKjE4hWjXthamGex3RUVzFGzZqnMFG0b1a35PCVejT0IfVNmeBSTN3wXpqtqyW87C8OXxAt5bo0nABE4k09KAadQAC7SSIyfcAf+aM6pgayEG12fRju6Ac4T+rFXXku1HbxVwSh3yXx+G8hLgBeRTD4UqsSgqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yKII0wV+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yKII0wV+"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5131c48055cso2558807e87.1
        for <phone-devel@vger.kernel.org>; Wed, 06 Mar 2024 08:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709742186; x=1710346986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Sustw/UCAeUUyY936QXaGUX8YthNOQNToX9WoMoAYA=;
        b=yKII0wV+jvbFHtQQotGuCCS3LwkdnQWoCebGmHYpZLKb8OckxrtegEaz29yjotn+t4
         C5kdgveqUL6Zd5LlaZcnXYDRH1iZMFBTyAgbqUHsz9HK3C5NRCeL4g74zs4/MoihIsl8
         hT7LvTgx9pIbRqZhnivjt+K6aoJjNcdWceyBZihHvW2pRwyaEGScLCd9JqLv43gssOzm
         /JiVUvpqlU52qdSddyGIoS2VVk6MhuwVA/x1OuZjU4OcQdXGq+LcVzAsZTkp2PQhSx8Z
         jN9TIAMwh9hGCgvV1UaD7tmtEBvFaSiYawJKlnD04VgRYuXC/sM58crfuyCToYANaCmJ
         f8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742186; x=1710346986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Sustw/UCAeUUyY936QXaGUX8YthNOQNToX9WoMoAYA=;
        b=mDxcvi90VDKyjCrvtM8sKxyNG0kh+vixu1zqWig/ZgDF74Qoch2GHWT+S+7DPcMepB
         Bt8tOa3nxp+1vbQwmsg9rqWGIGcDw+L12cuzszRijfz9qPpXnfM7swa/8iIwhM1hMs0w
         KG1Np/xTVa1gLSIEE9zTYhsbtf7Qmi5PSXM5MlvTj07dg+vaZptLuDaDoQ5RCEFBhbIQ
         WG8YEUc7LzYkWkWS3hUtpimyN4B1IyUg+slKaeeR4C4Wd/VgkF+NDRX+aH91Jb/nzcnY
         y3jK3LVExSKLs9NN1l7De20wqPgPitgvOEam4sbtMV7QXC5ohrkGKqb8S15bYCRpa7NZ
         519Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNJywreBcZjlyfO35Uy0FkLXQb0jvPU4Xkq9ZNHRkyr1BwoDmxWrd+PBHOXVzPWJcCbgYWDF6C0qS874MvYIlY/tAyCrfa62wNbJI=
X-Gm-Message-State: AOJu0YxJvZR30FssM+IAwTZU3DgI4xxFtT395M8DdBRBkTD7bmgGYP3d
	G0juQ9pbU2K910D0RPjuVq4Kw15H5JxOCraN47zXYO8q/EqX0pXi6gjFUKxX+EU=
X-Google-Smtp-Source: AGHT+IEAop9sVtkU9v+SA5q3UwOuJJehuD+/laWO1vVCwrGxrS2lngzwlNhZ4mqWY+bfhGVmNxpWrw==
X-Received: by 2002:ac2:58d9:0:b0:513:506:219d with SMTP id u25-20020ac258d9000000b005130506219dmr3589573lfo.49.1709742186319;
        Wed, 06 Mar 2024 08:23:06 -0800 (PST)
Received: from [87.246.221.128] (netpanel-87-246-221-128.pol.akademiki.lublin.pl. [87.246.221.128])
        by smtp.gmail.com with ESMTPSA id z15-20020a195e4f000000b00512ee143d25sm2728509lfi.105.2024.03.06.08.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 08:23:05 -0800 (PST)
Message-ID: <1167392e-c0ed-4504-9493-5658b4d66b51@linaro.org>
Date: Wed, 6 Mar 2024 17:23:02 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ARM: dts: qcom: msm8974pro-castor: Remove camera
 button definitions
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240306-castor-changes-v1-0-2286eaf85fff@z3ntu.xyz>
 <20240306-castor-changes-v1-3-2286eaf85fff@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240306-castor-changes-v1-3-2286eaf85fff@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/6/24 00:18, Luca Weiss wrote:
>  From what I can tell, the camera buttons are not part of Z2 Tablet
> hardware even though other devices based on 'shinano' do have them.
> 
> Fixes: ab80661883de ("ARM: dts: qcom: msm8974: Add Sony Xperia Z2 Tablet")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

https://3dmodels.org/360-view/?id=82800

Doesn't look like!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
