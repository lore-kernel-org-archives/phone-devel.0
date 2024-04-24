Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F14F140363
	for <phone-devel@vger.kernel.org>; Wed, 24 Apr 2024 20:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713989686; cv=none; b=X+9daNeAW5saR1b5IeQkRJmLhj4+djQK8UzJg6IHMOT+q0rYThrWG+1UMTBMSNEDQirxrqSr4qPspUlOrThMvpeuDZzeAL9q1yROuEUV7bR4bBBv6biWNhh1k8AvXnCg4os5EkwE7IAEbzjTfCtBeev/gJA+dUeHaVe342TOkzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713989686; c=relaxed/simple;
	bh=5juKDdGEYxNl2ENPjsF/4a/Y2iZb9ON1oaGj0sw8O/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WSRWoghMr5oYvtpkNTrzMyAkuY72JHr8uPK1JJHi2s+md+bsc2oq0UeJbT02NrUVkpBZDXAhymXawFpyktKc+W9zLzL843zb3t46QK1KnmXz8dpPDPtTTdkmh2TYY2mg54m/xMVe5apj91a9NLF03OP5QJuPUrfSl8dYN2RZIMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kssF1u+2; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kssF1u+2"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2dae975d0dcso14159281fa.1
        for <phone-devel@vger.kernel.org>; Wed, 24 Apr 2024 13:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713989683; x=1714594483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rcWOpWv1JwDPxWKBqvGmsKPJY5XCaFq86YjpwkCYxAM=;
        b=kssF1u+2ueTxkV7YbInRzGjki5stAj8wmtxHqAiCG9YpVuKukEl02cjJp3Zs87r/92
         k95bQlhf9OjGvOloeorkLFi1ncIHw+MuzURhFILZ/UZK3m4/UaiYNsq99TjjGl+myvQh
         RJyr51AJjEhvXIWq36n12VxViLhi/+8xGqSCFmkPC2xVJ1FJ56LJ1wSz48vASnqQaAEp
         QroSl4+vKtt4nuKn76G1HGSvxNoNUP4h6DoDC67+TkA/xd/HTWpapwaviLhSN/wA2OmM
         jwGodqGsaJvqJa0hpwfuzA1dgmdJr3OgQ9Z6S5dbD5ZQhggcD9/Xr03jBUR6m+jhFuws
         VGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713989683; x=1714594483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcWOpWv1JwDPxWKBqvGmsKPJY5XCaFq86YjpwkCYxAM=;
        b=qSjIhb6RHJZ+oDeTDyq7mXpGutCl2oARyafmCnlOq45jd6LO9LHx+ITMg2kiwpP3I2
         KTyXnPzO0D70ncCIAbdIk9VHE6GJ74WlUNzY2z/0SRbx26yGOLzR6CbnNoUI1lDmixwC
         BQeXdqxZW/RCana8JRIhWw1BHQjU3DoFudW8E+KOFTnoJm4i8I5CnaWWf7EjxD4gXEae
         s2GNSUKcCQ0c1jXK8hew5/X3PX3HjZxsrjCuvvA4q7NvLW5oQtXi93skJe0Lm/nPYU9f
         OaJ64PymF7hHn1yYZDArLU7mCC01rsYrC9SjyzFxJPa4TBHXDmd7qC4v1vMCdCQtn22l
         FD/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVa3Y1rj4/CUEEIkW5YAkMUyFJb2Fke6HCZAIhlILiiAEEvv/ppZL0tclOsesqyVNi9yQSlrQnjuWMd7TRqYDn/eiGWkdQasjBdHPQ=
X-Gm-Message-State: AOJu0YwfyP7a2vHSeOmj+ziucuxUYur2pgyv9pf7N30mKZZuU0NwvqCR
	VQ0SqklfEBVuhfqRbg+QO5UUG52k1bUR+9p/kGrYBKXdZgQiilS6cBhWTSrarsM=
X-Google-Smtp-Source: AGHT+IH9wlcx4Zg+9QomKNqCiiTVcanWix96jlPdIDd7H3SL1paT78g+EIL8htxmS7imEX6O6XqwzA==
X-Received: by 2002:a19:914a:0:b0:513:d71e:eebd with SMTP id y10-20020a19914a000000b00513d71eeebdmr190966lfj.32.1713989683584;
        Wed, 24 Apr 2024 13:14:43 -0700 (PDT)
Received: from [172.30.204.223] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n1-20020ac242c1000000b00515b5cd2361sm2485942lfl.164.2024.04.24.13.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 13:14:43 -0700 (PDT)
Message-ID: <439e44a6-8026-4283-a2b9-6a2d655f28fb@linaro.org>
Date: Wed, 24 Apr 2024 22:14:41 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: msm8953: Use mboxes properties for
 APCS
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz>
 <20240424-apcs-mboxes-v1-5-6556c47cb501@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240424-apcs-mboxes-v1-5-6556c47cb501@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/24/24 18:23, Luca Weiss wrote:
> Instead of passing the syscon to the various nodes, use the mbox
> interface using the mboxes property.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
