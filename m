Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E985256C6D
	for <phone-devel@vger.kernel.org>; Wed, 16 Jul 2025 07:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752650402; cv=none; b=SQTcTnC0s2FbQ3Acguz2xdCPbaqpb+RDJHRf6qo4HmQkRDjfR1ic0xy19wydWp2tBJ0q4AU8pPtXzd7r6CzsD1dHBfpHwMrLJ9y3+ShdLA1Yd6Hy7R+mlS2vvQxYUej7mPfTmanizBtOHmlJWBT9m0kN6owIhwCHrmkzd6iwlEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752650402; c=relaxed/simple;
	bh=sLBjAxUF8f0bVLkAa+0Ov5QiRQzZ9hdeQ4tEfeTn6QY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=j5FOqtLrX4BvvRrTod1Bur/dPTOtgn2lP4mCFsUg0GZ/PF3VndkqdkqKGlIZWI0A1SP+1MXTCfGvJliBv4qf1Pw/HhdsoU3IibcHPgI/8ZbHhDYdOgAqH20QIaWpA9NvgSjWhK4BGAeRHuf02JTcQns2z/W2EFdPahbasr9sSPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=0V5sUMnq; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="0V5sUMnq"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so10408510a12.2
        for <phone-devel@vger.kernel.org>; Wed, 16 Jul 2025 00:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752650399; x=1753255199; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpS7uKmXirtt0SzgMZ5d4QPt02O2nNF9SJVnwbn9UkU=;
        b=0V5sUMnq6XUZ59pl5vKImk9+DasmiDKM+skGK+YgqapvslnmUAp5U3auvJnNo0nNqZ
         SKDEMEIrZJwv3nufAaO/eSi8+UEpN1RGqa29qtRpdYL4rEi9GOxxMN/SGZxSsfnllwQR
         d9PXqQ+Ex65ejoCoH5WKIzRehKdOqqA/mAhfsEY5ey93h1e2EAnYPfEFU7q9uduKLUrp
         BQ1Ai6vFMqD69WumxHe8c6MwikXyKW+2HF1XuApOG7XZ4faB4gK/fz4AseCAFayKIP4M
         lxHGzwHYP+xLJJiZho2i9gu24NQlo7C2S6MQeD8rS0lcAQ5UImXhgSEsqoQAErP1+JVP
         1WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752650399; x=1753255199;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vpS7uKmXirtt0SzgMZ5d4QPt02O2nNF9SJVnwbn9UkU=;
        b=hK1EnzcFOBGtjjzOJWro0953GHyu5S4lrzY6tcAhSNZMlGMclRd6ysA3j6FXf5hEsx
         7j7FLoI/zIDKBnA/hTLhlELnWGhmsdIW+rjG//LAhX8CxC12pNndXmTSdN8ABJqGquq3
         Xf8MzlWA9vosPvqbi3aftpmLa8gRmaN/ed2Yoguwv4t892Y9KvWjDh/QjNdYnFOl8ubp
         RwxcP+DQC3sWe+BQSBv2RqvBUbCexPmb2S6gPMPQLOGq+o998LGFNKBfgacXKKHUyBAd
         hgRf9TmIex4UVthWEOu0DjA1FobK4w2T5fPSJJ/jQq/Qdo6V0y3utT5h8hGwLFCi7OVf
         AIXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmTjLp9V9/nTaonlGpIUam9gDnIoUOstmV3mlHULyU5PPy1lsEf+B7x+UwcXYkn4BfOn/Bi3NUJZ6Pxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOWbK9czniY3SSly9WitubS4edjRgUnaJV+K7t+GXtUMUsbtg1
	fVZvYmRuVU6G5byOU36TyFxiSjshhP8/ji9Phu0B7NpsIoV0LPcfZjlhcGFfhG0xTw8=
X-Gm-Gg: ASbGncumTSHGhw9DR0Lre9hkHdlDqB25+bWC3hYKeajwiuCTGEzMudQcW4ckrPPyth9
	HvKhkXW79HKkBAaPd+esQdy7eF0GJgNPde1IgBZCcrv85qJspgWbsBqkG7i2Iz7BLCJivg4nLPe
	cMF/0FiOQY1W48Wlvk/cH9AbXLF8AxWBOGnNjHz6mwrFyCiWLronEXOjpaX9/WHCxHO+vi/HTeP
	T3qGcEJll4sx3JG5T9FOtUNbsZT7z8SgiplyMYg66CYBsVfGQWz1jok6V8YSDbpXwkuPBvkjk2d
	xxaps65WjmSYy9rNjR3LC2fx9qJndxHGbzf3nfgtOtWUkiz1PRf2LlPo2+fmVdI6VPkNl+bYW9h
	Iqlmpvc2S8UqxQc6dK2MCiti73+eqgv0n4dkIFrOlm7kTU8V1bZ6yJvI=
X-Google-Smtp-Source: AGHT+IFx3m1lBU1VkWxih9GukzBwademENkA6wKJQrA2d11n7XWBx80BohXOxpWjVJdh9pJ5agT4FA==
X-Received: by 2002:a17:906:6a25:b0:ae6:b006:1be with SMTP id a640c23a62f3a-ae9cdda3d41mr149340266b.5.1752650398619;
        Wed, 16 Jul 2025 00:19:58 -0700 (PDT)
Received: from localhost (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee459asm1162633266b.52.2025.07.16.00.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 00:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2025 09:19:56 +0200
Message-Id: <DBDAPORDD5IM.1BHXPK225E2PP@fairphone.com>
Subject: Re: [PATCH v2 0/5] Enable USB audio offloading on Fairphone 4
 smartphone
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Felipe Balbi" <balbi@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Wesley Cheng" <quic_wcheng@quicinc.com>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>

Hi all,

On Thu May 1, 2025 at 8:48 AM CEST, Luca Weiss wrote:
> Since the series for the USB sound offloading driver was finally merged,
> we can add the sm6350 dts and enable it on Fairphone 4.
>
> A few devicetree binding bits have also been missing in that series, so
> there's some extra patches for the basics in this series.
>
> Depends on:
> - For qcom,sm8250.yaml & sm8250.c:
>   https://lore.kernel.org/linux-arm-msm/20250425-fp5-dp-sound-v3-0-7cb451=
80091b@fairphone.com/T/
> - For dts:
>   https://lore.kernel.org/linux-arm-msm/20250321-sm6350-apr-v1-1-7805ce7b=
4dcf@fairphone.com/
>
> Devicetree patches go through qcom
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v2:
> - Move num-hc-interrupters prop to sm6350.dtsi (Konrad)
> - Sort cpu & codec nodes correctly (Konrad)
> - Remove usb-soc-be prop as it's no longer needed (Wesley)
> - Pick up tags
> - Link to v1: https://lore.kernel.org/r/20250425-fp4-usb-audio-offload-v1=
-0-f90f571636e4@fairphone.com
>
> ---
> Luca Weiss (5):
>       ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
>       ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound card
>       ASoC: qcom: sm8250: Add Fairphone 4 soundcard compatible
>       arm64: dts: qcom: sm6350: Add q6usbdai node
>       arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB audio offload su=
pport

All dependencies for the patches have been applied already, so this
series can land as well!

Devicetree patches go through qcom, the rest through their trees.

Regards
Luca

>
>  .../devicetree/bindings/sound/qcom,q6afe.yaml      | 13 ++++++++
>  .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
>  arch/arm64/boot/dts/qcom/sm6350.dtsi               | 11 +++++++
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 36 ++++++++++++++++=
++++++
>  sound/soc/qcom/sm8250.c                            |  1 +
>  5 files changed, 62 insertions(+)
> ---
> base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
> change-id: 20250425-fp4-usb-audio-offload-e5d7fb55d283
> prerequisite-change-id: 20250321-sm6350-apr-15f3e7e4e5ca:v1
> prerequisite-patch-id: 69859554c94de52068406dab0d2869ca26072c78
> prerequisite-change-id: 20240809-fp5-dp-sound-b3768f3019bd:v3
> prerequisite-patch-id: 2d8997a2be02cfddf3a054c79e7eb308a6d06710
> prerequisite-patch-id: 1b7c8f00ab50ae71c0221868578b9c1dfe939e4d
> prerequisite-patch-id: 4fd0673c4d35c1fefce63ec5785ff5ea67cc3d3a
> prerequisite-patch-id: f5ec3a893de19900f62dc691d83986f1104914b0
> prerequisite-patch-id: fce7573c39e768f7a09c002064b6159b8e91161a
>
> Best regards,

