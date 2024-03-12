Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9527B3ED
	for <phone-devel@vger.kernel.org>; Tue, 12 Mar 2024 14:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710255236; cv=none; b=cikOH/GqIKusQvLlyDFCu4H4AaThwyDErReMEy635oJwGkjGBlESN37w89koKbrljrk91O8m6dqQrx773ghJs1gW7ex8evmSN6Kqc4bRD8iaKRgbQBThbTPJi3ZZuWYQ14p4cnM8sLskxF37Le+OWTEqCIlfz1DCqL4vbU522P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710255236; c=relaxed/simple;
	bh=bGGHbUurf8z2aahIEBEQAO22P5jFwd8to0iY7TOjxHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ev2cldeX1O9eM9ReYNMBUyVYnKZP32MyIS01Ab+nfgvB10O8tYmg1GyBoEvXJD94ZLwgUjJzNEDY8BWgq3FNB6TJ1CAdkSt2dO+0O40D9UOW0kIx40jO2hIPhOrmUutqxHyLENvyG6EeiEbq+kOyuvMN0ICRX9nRfseIfNLUYpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vmebt6rN; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vmebt6rN"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513173e8191so5886519e87.1
        for <phone-devel@vger.kernel.org>; Tue, 12 Mar 2024 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710255232; x=1710860032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=keCLG9SnPqnp4c4TkDEyJxwdSrYn/phlS9CwfE8jy2w=;
        b=vmebt6rNs76/YHosCZ/9QU/lg0PfyTRk0cYnyAcI2ZvRBqdEtslHdvlpQH8dh3syQD
         2QqO87DsPD2AEJBLvGp/f4W3Kpl0eJCD+rk2eOGtJkc5nMzJ/pX1u8oxqrCGMA+qXwpq
         YwD8xzvIMjsHTjnf5PH4SlMQgNk4p4HcSYkJv24Ax2h9CG7U4zf36grq2rfX3NIwCkHg
         LSftkcS5uDlmc3aOz7EzgO9nE5eqxE/TLDjLrCXiwhW1hOp6ISG4bP6Zp336D55gpkiV
         S9e9g6dX/TYaWulRY9/SvUdjMG+1u/tOcqw0owQi8Fo0bF+OxiDVz8x9pQlnblWqcwmo
         tB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710255232; x=1710860032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=keCLG9SnPqnp4c4TkDEyJxwdSrYn/phlS9CwfE8jy2w=;
        b=fuBe2AoRMYcOIsR/H1xx2lNo2TfCQbEhCORdI5XitC9Xd+OgXKzMRoX43HhaP5+muM
         4ocB+zzOruYsNzxXX/ER65SlzEpKKt90dmn5slvHJSaFDhwPtViBgZl0KQVGglh6By3I
         KXxvEt74KQItOhKGvrfoKMUw2V4OvUOTUxf0+MLFRdeiwUilg3pBQ+j0KKpf6B4AbwHT
         7g3HpGZryll1PGFPPGmbGrjbk09aQf+8sVg/DNy+GvCc74d+ODxb9D43KVveGi/EK7V1
         +7xoRGocosdwAgb5WGC/WjCCqkjQ2DLyP096mQ1s5W1Hxd2b79GSZ6NyCzIuAj2+2T+Z
         tKKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcwpH6tskmIdif2uICiRrg6QUs2tmuG/B7zhjOXkPVNeBoOyvzgGP97X5XA5OomRYS+OtpHGD3LJELC78ctKzWu4a8SwaFkDjiLKA=
X-Gm-Message-State: AOJu0Yzp9F6vt0nZwL+sDg7n+uNj9I42BXLghvbMiloiR+53xI/5J+Mq
	8UEhkoM4dexbxG6+C1RiW0nRhqTfb9g7I3i/ENI53jgKQRCqh+mLSsJp/Nr95Ic=
X-Google-Smtp-Source: AGHT+IHWscraXWfl9i2ubcI6WwPw3EVwwdQh9J4Hzv7X4J9wenpjW8/dzOuu7lN6Ggow35umWvP/Ag==
X-Received: by 2002:ac2:4da7:0:b0:513:b062:98bf with SMTP id h7-20020ac24da7000000b00513b06298bfmr246742lfe.20.1710255232372;
        Tue, 12 Mar 2024 07:53:52 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id 2-20020ac24822000000b00513c58e7601sm66644lft.284.2024.03.12.07.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 07:53:51 -0700 (PDT)
Message-ID: <5046cdf6-8111-477b-9724-c68183e5f357@linaro.org>
Date: Tue, 12 Mar 2024 15:53:50 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: qcom: Add Sony Xperia Z3 smartphone
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240310-shinano-common-v1-0-d64cd322ebca@z3ntu.xyz>
 <20240310-shinano-common-v1-3-d64cd322ebca@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240310-shinano-common-v1-3-d64cd322ebca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/10/24 12:41, Luca Weiss wrote:
> Add the dts for the Xperia Z3 smartphone which is based on Sony's
> shinano platform, so at the moment there's little device-specific dts to
> add on top of the common parts.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

modulo missing makfile, this looks good
