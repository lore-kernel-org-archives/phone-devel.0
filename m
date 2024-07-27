Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868C230358
	for <phone-devel@vger.kernel.org>; Sat, 27 Jul 2024 22:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722118702; cv=none; b=J0/WhWOLSWt0Mky05iQ+Vk0deAZcdzEKkiBT6/JovUCvGx5m+su058dxDAxu4QKNNai0tNYBaBeMvncB+Y8TE7ufgOqkea6El0Lt06pa5fr+jtGih7vrjwAk1wKK2tM6yvL/ODEEgFLAplPClkJYVwROHa3I09y/Oi+32dlQRUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722118702; c=relaxed/simple;
	bh=5lFK4MT8kHjxmIDSWsaDwLNDfSAtd1FNjuD5F+3Vnk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJIOnk0isimDrMePnlHieVWkcshm7QEI05sAzuEeC2qp9nWrll+SvsgfDnNKnrl2QzSIWpAQLuEaD10tz9aGXpM3BBSDAv9o1+FyMiDWpjcH6mwvwKwpPjnDwyeFx5lLU8MsuLkeYDCto+YRwxC6n2a93QLcWpAH62xiiK4WDr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ULIjy17M; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ULIjy17M"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52efa16aad9so3320407e87.0
        for <phone-devel@vger.kernel.org>; Sat, 27 Jul 2024 15:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722118699; x=1722723499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SRPFdqDNMT5cVtgo5Uruy9LQl2dnULjagrFjzTadsmA=;
        b=ULIjy17M/R2H95Uu386xs3KG3yiU4o4K5fMaJui7hyE3bFbmeJ+pUYdeBrykCfkQJR
         wRfavlKqFlA8E0JdKOhiJlxsg7vXL4Up5cRwHXiOukQm60tbAQ+Q1A5WjLWGOCxZCQk7
         y4iK7FMhsbWelUiWWvWkSMM9C8zeA5fzLeDQ4HCeJdvP8Q0pNWkfVKSjkmgvRvV5uzKU
         obqapUXj4OZohM8+TWVauBwQ/1uDQC1i3kZ1x5tZrYKzSxoQzjGM6KgTiQ4RveMRr3Wk
         t4JCa2KM6MBBcLcwDSLCMAn32AXqpz8K6wC7mwBmvCjL93aeugjGXRAO/i/xZTdG3OYV
         jbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722118699; x=1722723499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRPFdqDNMT5cVtgo5Uruy9LQl2dnULjagrFjzTadsmA=;
        b=kxJfxKm8ioWlWY8MxT029vv0mXxi8s9RwrPU+o6f8nWj82CkeTgSm0AnCgKLKBcnou
         ZM58gP6r4R8M8rJbEwNsaSyK9zYRbQxZZ/WZQsoRf+TRqYqmddkwITrmSqtfD84VsNrA
         rXeoGhgVB5FU/MlBxqFdurYo08pj0JgXGEEjQUgUzZxwV5PnGGtd5zH4pe3s+7wDd8SZ
         5nLX650vo/EdQyVTE/cKSBqgXTJqEv1ZE0dsbZHx1khmRnnHnxO7IClh1ft+vMvoN2a4
         ND6VBIzc0VG1wemeLdnXRPoOzpcrcEd+jvH2IAAEff9YPFpZ6W4hIxd8VqumExtPgQ7q
         jWdg==
X-Gm-Message-State: AOJu0YyhS1Z46rHcLOLOJhggohT9hNAkK29Tyv2du3TvvIsSvb3ssM3J
	pjMu/BR9Ws9GlCW4OtHjtPKbdGyoEoW1qK1qJvEquvXePfqpIAMfTMQw6NRBAUA=
X-Google-Smtp-Source: AGHT+IFUBQ6q8OXXKFdSK1WefD+EdS1b4NdGUG2Kdoz2aBuzpXsjNTWAKu80JFuplft0bFTX/L8E5A==
X-Received: by 2002:a05:6512:606:b0:52d:582e:410f with SMTP id 2adb3069b0e04-5309b2c3061mr1949742e87.46.1722118698555;
        Sat, 27 Jul 2024 15:18:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c196e7sm872644e87.190.2024.07.27.15.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 15:18:18 -0700 (PDT)
Date: Sun, 28 Jul 2024 01:18:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 3/4] ASoC: dt-bindings: apq8016-sbc: Add
 msm8953/msm8976-qdsp6-sndcard
Message-ID: <ctww7q6kmkvke7acubxupsfvi3cmvn3i4h7s7pb6pmzw5hl4ry@w35exuha32k7>
References: <20240727182031.35069-1-a39.skl@gmail.com>
 <20240727182031.35069-4-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727182031.35069-4-a39.skl@gmail.com>

On Sat, Jul 27, 2024 at 08:20:26PM GMT, Adam Skladowski wrote:
> Document MSM8953/MSM8976 QDSP6 cards.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  .../sound/qcom,apq8016-sbc-sndcard.yaml       | 51 ++++++++++++++++---
>  1 file changed, 45 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
> index 6ad451549036..1706ce334d2f 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
> @@ -15,16 +15,16 @@ properties:
>      enum:
>        - qcom,apq8016-sbc-sndcard
>        - qcom,msm8916-qdsp6-sndcard
> +      - qcom,msm8953-qdsp6-sndcard
> +      - qcom,msm8976-qdsp6-sndcard
>  
>    reg:
> -    items:
> -      - description: Microphone I/O mux register address
> -      - description: Speaker I/O mux register address
> +    minItems: 2
> +    maxItems: 3
>  
>    reg-names:
> -    items:
> -      - const: mic-iomux
> -      - const: spkr-iomux
> +    minItems: 2
> +    maxItems: 3
>  
>    audio-routing:
>      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> @@ -106,6 +106,45 @@ required:
>    - reg-names
>    - model
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,apq8016-sbc-sndcard
> +              - qcom,msm8916-qdsp6-sndcard
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Microphone I/O mux register address
> +            - description: Speaker I/O mux register address
> +        reg-names:
> +          items:
> +            - const: mic-iomux
> +            - const: spkr-iomux
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8953-qdsp6-sndcard
> +              - qcom,msm8976-qdsp6-sndcard
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Microphone I/O mux register address
> +            - description: Speaker I/O mux register address
> +            - description: Quinary Mi2S I/O mux register address
> +        reg-names:
> +          items:
> +            - const: mic-iomux
> +            - const: spkr-iomux
> +            - const: quin-iomux

As msm8953 / msm8976 just add one new region it might be better to
move the lists back to top-level definitions (still having mix/maxItems
next to it) and then in the conditional branches just specify maxItems:2
for apq8016/msm8916 and maxItems:3 for msm8953/msm8976.

This way it becomes:

  reg:
    items:
      - description: Microphone I/O mux register address
      - description: Speaker I/O mux register address
    minItems: 2
    maxItems: 3

  # same for reg-names

[....]

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,apq8016-sbc-sndcard
              - qcom,msm8916-qdsp6-sndcard
    then:
      properties:
        reg:
          maxItems: 2
        reg-names:
          maxItems: 2
    else:
      properties:
        reg:
          maxItems: 3
        reg-names:
          maxItems: 3


> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
