Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834BB5CDE9
	for <phone-devel@vger.kernel.org>; Sat, 10 Feb 2024 17:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707585554; cv=none; b=eMjGJMZc/DCv1TpN9ThnN/6LUN+qVA11mH1fLSHZFePatDOlAj6nkrbFRPc0Rvjlq3uBN+qTcaNXzs6GskqS29nveZ2Wd64I0fws0SLv8d6w+SYobh5a2pCY9A3ZPaOiuu0osj2SeZwFaEkj54xdDXSb3OsH9TQXDKVflpLTXLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707585554; c=relaxed/simple;
	bh=NYudsIGjRm27pkmw6NfIzTDAlY58kWaMj/QkAiYov4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWu1aAcRj9xi0x6XUzZb3BIuwh5lHr/g7avwv00g4Mub6V28C7EoX6hZdTYKpgHLe5PaUmxywdrzGK1QZJ4zxR9DI8mD8l6yj97w5N31JhlY7zykXZHV8rtMkm22OhAblLPjYMj0A3m271+EQuXYH1cGzt/VVOMmq8XQAhqZYLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FHV/hj3K; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FHV/hj3K"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3566c0309fso230581366b.1
        for <phone-devel@vger.kernel.org>; Sat, 10 Feb 2024 09:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707585551; x=1708190351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UPPfoSPtlGq/Vz0zCl0yTdi8JSgrSbydPmzP0jiNjJM=;
        b=FHV/hj3KVFn2TW+vxL0Cb08qRLakb9PQaR5QvIMHACKWybvRnsGtagyk8ShF6Ub0NU
         Pu6wEbWKgYYFJktaUoHe/cVWZubDoCfE4mSEDYMunUWDPuQpvv7f4orxIcgokHNevLAR
         ZOXvXJuyBTdzaALSyEzjANPj+6rLk52dYyoJtLT6e2q0u7KZ1cvsZLMipoCwWv+Qf6T0
         gp/VIYRatSJIizSG54747J9SgMjtNJpKitwMYNUvgPQwYXhazGXA8pGHUPLSi1XzacAp
         fVUTVfkA3SnIcajD2UHzTeGwRqhh0DVHRjKAltlPJW3cTSZPpmef/Hh66l4ZHEHy51lP
         mZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707585551; x=1708190351;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UPPfoSPtlGq/Vz0zCl0yTdi8JSgrSbydPmzP0jiNjJM=;
        b=WP0Q9GpjCEuhI1gpbVIeMBJAimjKngieYZHE7D4r/nLLArBj5BIE2hhTYjRgRhN4VU
         BxOQq8zsAiYLBzatCZIXkziOj1GXHo31I3yRt/BI42QNYHQfecrGxmTlUAv6KlGl9af9
         2n3maUtmXAlOqL1pEbVNA6tnop9oWsQ2C2ujQ9BQFbDKeUfAxf+QEy0tlY+i+NdQFkMU
         T4uqauB1ym4AwiACPyrI6uVPdJJ5VgW8s9Mes9djMTOPxi98rm/K+NuLE5CFy0N/7Cw0
         G+kR4NpleF9WDy+sG64Ykxwo7VMmxKpMhxupdophOPUJdG/46SYD5DuVW7ejdCK1xOcv
         cJXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFKfu6hahDr9obvvMsG2nVXPf3/HafRX67l6ydK9ygZXPuNkuE+d7Dn9iD5ZPwOtx7TcQyl5AKjzut4Z1yY83fGDAbmInGumJUnrw=
X-Gm-Message-State: AOJu0YzuCmo24c0epFny1n4UX0skYTKuJBlFixXTMNUpDYZMXkTxaRWU
	/H1lS/d2HCZrXI/zswEkbbCcjd2m56LxusBqX4NYGHkyoJZg6VkoFdNrKfs+a2A=
X-Google-Smtp-Source: AGHT+IGf3lJjgMzTBNliFCNzGITS+DH/YyZWIGQY8pBo91UsuBBfHuCnnxy3Ge1cjbhereUEyz6q3w==
X-Received: by 2002:a17:907:9858:b0:a3c:2146:a0be with SMTP id jj24-20020a170907985800b00a3c2146a0bemr1531701ejc.70.1707585550785;
        Sat, 10 Feb 2024 09:19:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8EHLrQDnCbtgF7aPp4Tys6b9xyplZflPIlITe2JUzkER/f+TZ3YW+1QuqWab1ZqVx1hWI7gDCToCTtN5IveWnTIYJkgjK/tuD7DbIrM+PlbCrnLZb2ZnxXi5br7FA6Ax/fYDYrlQZu9bEpqxG5O0sulZvU/lnBUdb7W1Tn8rqSGvmcLgAj6jYcMvpWcHks1GSDS7Zt83ulZ0qayIbguRXhhwynGXVjfbWcnsGKf40pKXfpjcpUdknyP3YW63EiKCIA5a9HC2soubhCIC4Vt/vWmbkvCl+26UoxHIKYS3bLhfLjNRui/59vNhfCmE4LNF+bPnNy7tuuQstPRFaf1FNnMB+C8muvUhYzK0ZUIQm4PsqHgAb9OTAyEOgDrE5+xBvVCJmRAodWRemSO3U4RYgkSaJv8xpR9XndMFRZf9Hh4CssNMlKU6mEAFaXkX8DY9JvH6oBfVHS8bh5ocXoNJVlRR7LYv6epgKPfXcPQuW2A==
Received: from [192.168.1.116] (abyl12.neoplus.adsl.tpnet.pl. [83.9.31.12])
        by smtp.gmail.com with ESMTPSA id ps7-20020a170906bf4700b00a3c5fa1052csm64186ejb.138.2024.02.10.09.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Feb 2024 09:19:10 -0800 (PST)
Message-ID: <7b1a0b84-4a4a-43a4-8698-d22f883e6318@linaro.org>
Date: Sat, 10 Feb 2024 18:19:09 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] pmdomain: qcom: rpmpd: Add MSM8974PRO+PMA8084
 power domains
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20240210-msm8974-rpmpd-v2-0-595e2ff80ea1@z3ntu.xyz>
 <20240210-msm8974-rpmpd-v2-3-595e2ff80ea1@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240210-msm8974-rpmpd-v2-3-595e2ff80ea1@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/10/24 17:38, Luca Weiss wrote:
> Add the power domains CX & GFX found on MSM8974 devices that use PMA8084
> instead of the standard PM8841+PM8941 combo.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
