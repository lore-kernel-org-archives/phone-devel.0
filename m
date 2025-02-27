Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CAE1EB194
	for <phone-devel@vger.kernel.org>; Thu, 27 Feb 2025 07:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740642134; cv=none; b=Z7yFOfg2aLK1lf8YlRyjRE6JfZ+cvSLa2ikL/J4TiMCd3xmh/OKkEV934OnGT75YFrlu6W83aAgibur7a/Nf9zEGTuVoSAiwek3INjhTZPhkTLj5heft9VPzR2j2GylB/o3eb5hWZiXgRzLXE/N38uRXYCDmH3vVhB+cCto+heg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740642134; c=relaxed/simple;
	bh=hOWdYrxNiuPN+XNM7jJtHqXLqHZiONyk2eJf35zleLQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GPDslEqXRhBcg87iPd0/yK6zn1m2Rp/aJXjClwT/uSVF4IoNQRx2kpXhm9M3XyB+US826b0U5vBwjuglRUf1JCCf2PkiGbQwWazLZsKPG8RIYJU3Zmh/NhXfes0OZraHynBGzBE7fG/M0o83jkpr9K99X0cfmLNDOni3YoM7itQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=MqL0PS9N; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="MqL0PS9N"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso4045375e9.0
        for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 23:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1740642130; x=1741246930; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDstNabKa+U0RFMr+z3tANP7Vpq5gfUk2k27kasy3M0=;
        b=MqL0PS9NAInaTWnWSw7cHRNWcriR0cflcIq2/WF0wQrPby2EiMBOywObtHbpAuQfBx
         D8Wenx9alUaIUJ2vpZB/+mcuqA+o0UkrwxLcK6ImBng1qEuzymEgX0wJ5HCchYQbsqav
         DznWcnMWq2E7KuITZAStKu3mcCsJp47bjhYAqbD5OR75oIJswJoRxOBBYoeZJGB6zzXF
         Ksi4Vt97tMysPaGPnP++Lfi4vWz5VEwV7Gy9gi2fYaVyQuKyiCuM1Z+3hvDdm/I5hWAK
         b0Um9R0jl5vFdol5oav0NVHltb1AfxHhUY5jtbLHZiKHGAm9Xv0TuGNVa8u6q+iU6DtG
         ixwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740642130; x=1741246930;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vDstNabKa+U0RFMr+z3tANP7Vpq5gfUk2k27kasy3M0=;
        b=YKtnbo+GFWnMmBglLIN8A7KcQk1W57y/5EgnvxjlXhlE+iJI1tHjlz5PQUQbzMg8Wh
         hHfE+8qILgQ7BfjKM3DJGy4SnA/YVWXo3/TZl8pcaxl2kfvw1367h4zFUW5oA3uHEfBk
         vva9I0woNypanV7qOmNnrGAhlkDtr1Bhnh9PeIMeljZL5Y0gFNdWWb43x/0SONm/UGjM
         HHpvS9VEaD+mD1HtnnPUg0RLpwuSmUaOw3fP8fM1tnG6vRCyNOBKI+FGA3zDONLhnqfc
         XhOu1QrxHaCrQE/9fW9XuyIT5z+PPEI3f+nQutol+Vhqd467eXApPf6oG2A7LDnOje3Q
         JA2g==
X-Forwarded-Encrypted: i=1; AJvYcCUWkBiEYJzJ/vk4RxayHn3wAKc9twWDB4brvWhnBFX0hgTpPW1CTKJjodmZMQXYFWzxy9dpQl+7tjpD8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoFox5QHQoA1bg34f50K7S3/sWaJOEVpj12ttjdGePNlwku2n9
	dXQzPgWv33jnnhowYfiobc3SZHZ4EgpPFULDBMnmeN71ZiCUfKEQ/T3HN5LRc4I=
X-Gm-Gg: ASbGncuWBBRO/S3zDkDMtK3rdQQucCpIcDkK+cOKPaRcJoEePm63y7zYxAnEuQOgvFk
	lxdMogTn/MiS7HExKa/cdRc79QSzprL8MtD999Bt9YMwvDLJrSuxYhdjKX731FlNRJM67z5Ztj2
	NM1ZsIQr1E3KmAsRXoS+wFwokWbNe1YIXveU1Qe8qj7MYJm1rj8BSdMzR3StYvh6Z0ugJT+WKrP
	u1HSDFXDPkKvTRF8YIfaRMg5jwKLeph+/8MsZ/QLLfLrK5RklGLoKDssNtn1ilXLGLn5+1BPjTo
	ODIxtalJZxziyxa7/oTRuYuGc/ZgLhDb1L4YnVRVowu8M2O4sMlbE0UitRC1gaboXERZka4=
X-Google-Smtp-Source: AGHT+IEjgF0COFVrxkgx63jJMahBS/fzpXpuAZ0WbHEMTNr8DH0vZgYR2D9bi1jTvh7DSZQR0NvF4A==
X-Received: by 2002:a05:600c:468e:b0:439:9828:c44b with SMTP id 5b1f17b1804b1-43ab0f3ccddmr106690235e9.14.1740642130144;
        Wed, 26 Feb 2025 23:42:10 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba52b947sm45759585e9.2.2025.02.26.23.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 23:42:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Feb 2025 08:42:06 +0100
Message-Id: <D8324XX78W5E.273JA9U5U4NV8@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Fairphone 5 DisplayPort over USB-C support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
 <e5290e59-0022-4eba-abce-a11928d76d3a@oss.qualcomm.com>
In-Reply-To: <e5290e59-0022-4eba-abce-a11928d76d3a@oss.qualcomm.com>

On Wed Feb 26, 2025 at 6:44 PM CET, Konrad Dybcio wrote:
> On 26.02.2025 3:10 PM, Luca Weiss wrote:
>> This series adds all the necessary bits to enable DisplayPort-out over
>> USB-C on Fairphone 5.
>>=20
>> There's currently a dt validation error with this, not quite sure how to
>> resolve this:
>>=20
>>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: typec-mux@42: port=
:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpec=
ted)
>>           from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480=
.yaml#
>>=20
>> See also this mail plus replies:
>> * https://lore.kernel.org/linux-arm-msm/D0H3VE6RLM2I.MK2NT1P9N02O@fairph=
one.com/
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Luca Weiss (3):
>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over =
USB-C
>>=20
>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 110 ++++++++++++++=
++++++-
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +
>>  2 files changed, 108 insertions(+), 4 deletions(-)
>> ---
>> base-commit: 417c2d4ed67b729abea7dc73d7fb2153b7154d31
>
> I don't see this commit in -next, master, or qcom/, this series fails
> to apply atop next-20250225

Maybe I was a bit fast in sending this series, the 2 patches this
depends on have been merged into qcom tree yesterday, I've sent this
series based on latest linux-next + arm64-for-6.15 merged in.

https://web.git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=
=3Darm64-for-6.15

Regards
Luca


>
> Konrad

