Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07315287271
	for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 09:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758013678; cv=none; b=DaKbyp/Hy2tSM/AxihYfZpbCrrWXCKQzRHAK+WvwmAolzE0OLpumopO8OMx3NX3feCdAnnrWZ5rnhV1rIhUrwwpYvGjvlGUCNvkR0z/wbBdhSsQzxriG9s36tAUNqrS/eGHlYoe9UaNn4rMPQTgBQlX8/+wiM1kZfsDSGLO/Bgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758013678; c=relaxed/simple;
	bh=fM1QW+UFz5zHOwXNyLvYeTnh6QmXecM50gjhKcitTM4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WngR7bkk+Vi1cSYBeordDeI9s4sr7t7WdZbIy8w6tjTbKe2DeiSkJGofw+mIpMBQx3UhbpxSFnzcGff15PKEjpXabDeJSoRJ9riyDAUUDxakXK5nDDglABur+bCCD2M4rDQZCZ7yGS7eRSP/eSGbOUl/youkOSJ9eWqS/neDa3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FT/W+ex6; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FT/W+ex6"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7a16441so778415166b.2
        for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 02:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758013673; x=1758618473; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGPJfwEdnpfBh17k0uP4IdtgceOjAvM9dH/m5dD76YA=;
        b=FT/W+ex663OkQapBdsdZfiqLbYPbkbzVnog3Xs3mpz4Xgconp9x/dpGRHaPDtPNLW9
         ixh2cYtm4JWK60nHEFL7C90FMizD4O9NDpm0XgjKKbAKa6MQGVYIZKXtIyVNXEvXdPll
         xO78MacI3EikAFs5oCbgOJss/QVWcWRQP37/48n+Z1+GtSUaCGDnsrnrlVrWG8si7O1r
         94TOul6Ohbll7vJbAvAdeUmX/1lwebJ6Um7OcSVt28412nyHT+Czd6S3q0zXW3S+rlON
         zm0+nbxhnU6V+vNzOee64mcGan0mFlRda++wgZ4vaBj70pcHlZQrlVQPf/U9b0edpf2T
         khMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758013673; x=1758618473;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wGPJfwEdnpfBh17k0uP4IdtgceOjAvM9dH/m5dD76YA=;
        b=pv8iELxI59QlvMyq4Ra3lpe1dliN2tVM2pPZzbPGD7uVIBc9CvmaNQcOu8cqX3An7E
         NHWv22w9pun8HzehvP1N/n+DSXBW7LiN2m/0Rwd87DI440JQu5cgg/kYyrmo7Jpw9GjX
         RguD/vqreSLS2sEQpOu/zxofPoG1sIOew3U3+mKmNwlcsDSDeltiOgDrRIuZf3B/A9yR
         qGTDJfbhL4EaD37GcFJy96ehJX9wQ0aOHLdaCdIKnmcqYQfYJkdHU6jvDKr/UbnSWIKg
         m3+ps+HridItzqVVdKYL6bByaKK3IDeOs6m4NRpqBkfgnETPGFDfwti/NbBn1MsDLs56
         D6Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVnKR7NMjN5qNTgXWk3XEta8eAwhoE4YynEefK24Ut7Wgcltk0hQQ72LMyq9f2bKDw8w2xkQzxazlqwxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsK7mi8Ta+DvJZst+STav0iJgSE2XJvoNtbZAyeNe67PgXWR2y
	C3hiNstpNJHiVSzqQgHHnj3S1uP9OFAG+/PfFDQKbIJOMKiqkXNkOO3c+Cjo5UlM3bY=
X-Gm-Gg: ASbGnctfFBMBEoUxZ0SCe56kcpAxCCss6T48PUjZe69Q1vaosiGL8g+4RaDLy7IwVCW
	R2CkQdVAIRcwQ5ug1SgGCwE+muuUlniIwWO+LvRxJCjMBROqYm/qLvR34/E6vPXILQcHCd+mEOZ
	GcjVqSCZEgKVZuvQ116rGuIBFSbkvMnzhwxzwl5bXfRnXf8ATR3Fp1lFEUqO68dbC0EoG9YgokE
	RGowucJkabrc05y2jwabCvHgMZIS64NOf7yjb0lgfMCb30uCUULeducFRQYpm/iQb8XU8Z+PLog
	FL9vETfmG4afRoaUP6ONYwiO/SiabH3dVjspf84uXqrU5HhqsT9WcdqmDehVaNFZ6qFTUnvAr9R
	C0qxhS15LXXyfeTgZ4cfuz++tzMLLiRW2xkDQWoegGOO9zn5AUYzH5899myzinAXhk1jA
X-Google-Smtp-Source: AGHT+IEnV71DLjZiRWk5j6jXx0pnqls19vN1Qen2T1tQxSI6t57/t1s9FzfJ1We13UaEvDdr4m6msw==
X-Received: by 2002:a17:906:6d13:b0:b09:c230:12dc with SMTP id a640c23a62f3a-b09c23013dbmr778396666b.8.1758013673277;
        Tue, 16 Sep 2025 02:07:53 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c7159e6csm899506666b.33.2025.09.16.02.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 02:07:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 11:07:52 +0200
Message-Id: <DCU3U3SF3ZRT.ATK17JG93309@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 0/3] Fixes/improvements for SM6350 UFS
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <DBDAMGN9UQA0.J6KJJ48PLJ2L@fairphone.com>
In-Reply-To: <DBDAMGN9UQA0.J6KJJ48PLJ2L@fairphone.com>

Hi Bjorn,

On Wed Jul 16, 2025 at 9:15 AM CEST, Luca Weiss wrote:
> Hi Bjorn,
>
> On Fri Mar 14, 2025 at 10:17 AM CET, Luca Weiss wrote:
>> Fix the order of the freq-table-hz property, then convert to OPP tables
>> and add interconnect support for UFS for the SM6350 SoC.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Luca Weiss (3):
>>       arm64: dts: qcom: sm6350: Fix wrong order of freq-table-hz for UFS
>>       arm64: dts: qcom: sm6350: Add OPP table support to UFSHC
>>       arm64: dts: qcom: sm6350: Add interconnect support to UFS
>
> Could you please pick up this series? Konrad already gave his R-b a
> while ago.

Another ping on this series, haven't heard anything in the last 2 months
on this.

Regards
Luca

>
> Regards
> Luca
>
>>
>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 49 ++++++++++++++++++++++++++++-=
-------
>>  1 file changed, 39 insertions(+), 10 deletions(-)
>> ---
>> base-commit: eea255893718268e1ab852fb52f70c613d109b99
>> change-id: 20250314-sm6350-ufs-things-53c5de9fec5e
>>
>> Best regards,

