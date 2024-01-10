Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9C84D587
	for <phone-devel@vger.kernel.org>; Wed, 10 Jan 2024 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XaDV6z+5"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cd0d05838fso50037621fa.1
        for <phone-devel@vger.kernel.org>; Wed, 10 Jan 2024 09:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704908536; x=1705513336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YjMoBaJslgOWw0PjOC5tF8h+iRVzEHZGeY/kRdR3+Yg=;
        b=XaDV6z+5onLXuuU339LknRKfpPTyjc/j2P5TdU2a5JM1VpQwuhYIlqhkDOriUXrvRq
         /EHQgEGdXgp5iyun4JQgxFZlceEwp/MWAN/rlshJq3WpvqZ/BMzEko282BN7uBy7LU3T
         aw5szSAv81L7rzuL9YlgMj5E/aKdBxOBE5eQGGkN/ebsrVt3CGU5Q/DUMeq77GOuFHTN
         LrpIVmSvHTjvZ0UeKtDZcunP0wZJAozdHqzIpb3J+XAxUjSqMqUyv1xy/M2KVLMOfvfh
         D12WB4GOK/oLmWuK//qQs0VydScFgPTgXPp3xlx8+dmpIlyZojj47KrS+Xn8JEECtqJv
         sFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704908536; x=1705513336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjMoBaJslgOWw0PjOC5tF8h+iRVzEHZGeY/kRdR3+Yg=;
        b=ItSJZmn76S5KprV2axFq2JxWTbEOUPA0KkIDrTPI6hPrGCroraXkK4uPz4nR4foHEQ
         /YLwLxFI+S5A5U8nppFTnwRhYbOE/eD7qXEWUdubB9SKUNvsLxxjREpDilthBeO4fyy3
         aeYdYVnj/f1857G7TZs8Lf42zQEgJTy1GtGjBvZUNu+6Bc5829i9spBjGkYkbSgWyctR
         SmI7oYeqkeIfwAoSe6Pb7dCZrVqpodBOemlQdqmAEYqIlzMlRj70+XQiwg6KzlAmb08T
         sVTwpOfiV7CaNyMY/hT0XxqKVQFgKnds2NRZ7TQPFCus3al4Pu9ylSi1A2l76JOUNyYx
         vPjQ==
X-Gm-Message-State: AOJu0Yw/fLIHG7lplNqE5+LOjGa4bWmRATDMTOBZL1LIDRv0Ooz58uiO
	Cav2dcv2eVCSKi1m02c6oljDdxhpI5qGGA==
X-Google-Smtp-Source: AGHT+IHT1prjATADHPcha+6hRVeVajAEKA9n2RxWsP2L6hY0yEyK/iXNVOuhwOgvmCbXJi+mqMHvqw==
X-Received: by 2002:a05:6512:128c:b0:50e:30a8:4c8e with SMTP id u12-20020a056512128c00b0050e30a84c8emr682347lfs.43.1704908535603;
        Wed, 10 Jan 2024 09:42:15 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a27-20020a195f5b000000b0050e8cd014d7sm741726lfj.16.2024.01.10.09.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 09:42:15 -0800 (PST)
Message-ID: <2d200f5f-37a5-408d-9ca9-3137ec717647@linaro.org>
Date: Wed, 10 Jan 2024 18:42:14 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 display and GPU
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Andy Gross <agross@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-4-8ad11174f65b@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240110-fp4-panel-v2-4-8ad11174f65b@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/10/24 16:14, Luca Weiss wrote:
> Add the description for the display panel found on this phone.
> Unfortunately the LCDB module on PM6150L isn't yet supported upstream so
> we need to use a dummy regulator-fixed in the meantime.
> 
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
