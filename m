Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDE453BE
	for <phone-devel@vger.kernel.org>; Tue, 12 Mar 2024 18:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710269115; cv=none; b=apG7PIsr/kkdy+wLPGVHCGICd0BZjxcJ1wl+x6PoMZIdBpnnRjIELEAAxxIEdKrIt9pVyu78bFtmF2RwxBkTg/O3kC3pe9Y4ihR7NqUZebwPLnZQ4T+QsyYxg3kenDKrEgNkjUpIAyh8XuW1lmqo2QTxddhZK2TjTCpZZMoTRCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710269115; c=relaxed/simple;
	bh=mFTiZ2wd/WRZ34m7EIqEpy/tEPn2YrHtaKLY20O46rI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjXA1iU81Fe5tze0tNnisyElsUsPSGKaR+IBzMwFBTCU8/Mv/zaIMGGyORcnQ8OINFbYV1xcpMheGCqbJ5gxFF4duwiuNCJfzUJod6szhMmhGgWMDTOKETG91KgkAr6ZRY+khwRVyerLjsx5KeLvOpV42AJww8MGcmAJOhV+al0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LHuIv6DQ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LHuIv6DQ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51331634948so119172e87.0
        for <phone-devel@vger.kernel.org>; Tue, 12 Mar 2024 11:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710269112; x=1710873912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYvui7NOyxMvM6bvDvI6oELVEpcakMEK3Pa/BMDX54A=;
        b=LHuIv6DQTFQTZIBNEIv4Y60Zy4vEMGWuxYm1Cse3uzVXSszSLalGhn2ji9mqNr34WK
         HYDDO3rRPiiMn9nziVSFr+yFGMoAeHzO0okMF0/CkxN7Omdblq1TFRDGtJBeLRnBm9fx
         LDTQgSsY8+CCP17gQ5O9cZ0zcuDD8O9EDsZk2BFXaoWvEpyctNjoUsGu0CymOkxIXbpU
         w76u9criQTAI8wbhrntOJDVsdIP4SezM9Jy/hAMtCrU8a4lmZ8+cjP4RHEZwVfpwjyWW
         g5AosxOjRenIRhkZyezV9gHaHnioSQ2hGXZq+19TCt2ZV3/kEDEgmdRr3J57RA1xhBBt
         Ppug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710269112; x=1710873912;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYvui7NOyxMvM6bvDvI6oELVEpcakMEK3Pa/BMDX54A=;
        b=q0sN6hgzOVFn8UldpYkPO1lwp1ALINFXZw7dkcQi9bZ1U8Gvqj8nMlkkAx0q2f6fON
         IIpNANGevpn1mBMd/hqejrfMSEUqA2jWLPL+GNl/mFbo3d7PyhXJsv4dtIIljJFD/cDU
         2uTJ9+T6P9tL9ARidlw7G3bTzvYuRXDXYhu1b+Tg7hwcDUbqw0DrWX3liFVDP0x1Ni6i
         h6p3JItgGtoiuxnn2/nqb9A1rTj9jc8MsVkY+jAEjtHJ7sK4I+rWLmwbnKAnhz1uHiv5
         cYYxb+F8zkBRbNCXOm/qXARLs3PHNxFf+SW4dinUmT6kVWBi5qVQLvoCZxv+hnoym0gb
         EF3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNLhNuOMOt3tFGIO+v+CVEKC3G7+xOlZ4OxzSOsQdMs36AjNRazmzdpri4oycmdmChleLw9ByRVMKkgk59P3I7WIdLfm9Y82v5OS4=
X-Gm-Message-State: AOJu0YxcSmQGf3gFCL/be/vIn2rbWYGK0gQOpJnbnTMIiNZNgfdJPFiu
	unwk4pUWn1JnNjubhkaNXPFRPdK5uAK6N5jQZSvV/Rt5ZC7s7YegYN2BvqSl+2Q=
X-Google-Smtp-Source: AGHT+IF4f0OFvoQYPMgs4+2Z3SEeD3NCDQNRnV5sPYZXnBLRlvgPl+hsoID1mTQEGBnuIatascpQdw==
X-Received: by 2002:a19:770d:0:b0:513:c480:d03e with SMTP id s13-20020a19770d000000b00513c480d03emr135246lfc.18.1710269111994;
        Tue, 12 Mar 2024 11:45:11 -0700 (PDT)
Received: from [172.30.204.193] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t8-20020a056512068800b005139a231b41sm1676845lfe.161.2024.03.12.11.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 11:45:11 -0700 (PDT)
Message-ID: <10adf6cd-131c-46a3-9bd1-1f0af24931d9@linaro.org>
Date: Tue, 12 Mar 2024 19:45:08 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ARM: dts: qcom: msm8974-sony-castor: Split into
 shinano-common
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240310-shinano-common-v1-0-d64cd322ebca@z3ntu.xyz>
 <20240310-shinano-common-v1-1-d64cd322ebca@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240310-shinano-common-v1-1-d64cd322ebca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/10/24 12:41, Luca Weiss wrote:
> In preparation for adding the Sony Xperia Z3 smartphone, split the
> common parts into shinano-common.dtsi.
> 
> No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

I give you the green light to also add newlines between subsequent
subnodes (e.g. under blsp2_i2c5) while at it ;)

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
