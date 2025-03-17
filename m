Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A7323BD10
	for <phone-devel@vger.kernel.org>; Mon, 17 Mar 2025 12:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213558; cv=none; b=ucNwFYQ2Y8wTYECCbrxOYVI7+f+S8u7Nrz5J8rbdT0jlBwFhS4gt2JUw6pNrwxAgN2vyLGuvvsOZJIRzC/ne2vLrCqMAQj/NU7u1i2QbClIEDFHYxicZ0AOFMDF0Gwi5z4ibuG0+1XN4IDs0/0ur4K/1Xl+Plg7r0hB1lk5FUIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213558; c=relaxed/simple;
	bh=UgTOwub6IM8lyO1PUttTb8emd3or5wxqwiyiuHKamRY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=K5MCfnI8KGgvuOoQ/q/FfMKwWsHIj4RbiOeVTOKMErbPJM82gefxolENdqqRTf7qZs94JI9+PQ8W7yyLVFGzItlxFdKlZe7lg5Dlx/CYCEFJowgYt6tO9df5GpxXU2eHzloR9kHix8XMX/svVr0KsDk+/EuvzximknEma65E5eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2RPg9GFa; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2RPg9GFa"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso6405712a12.1
        for <phone-devel@vger.kernel.org>; Mon, 17 Mar 2025 05:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742213554; x=1742818354; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgQI7i+glIQS/JWP7XVCA4jeAmkUf5EqjBge8pBC6Ps=;
        b=2RPg9GFaS0FW/R6a/Oa+Eu4gYRoxkw4NnGeQWu4MxAfDe2PavyxfNMnduMLbEtAjDk
         SPB88KK6PZLywylXVcIzT50aKwDoaXulbBD8ELLebkQW/t3ItciM9/PAB1//OYrFMv53
         8br3+iGWwuKPZLhCaSex2hv3vFXniTuubIcjRV5lDJcsP+LgHiDDepOwZK4fEa+8KYlH
         9CqECDXEGlmD3/AweW6PqtBYnOEhTpju/DXSXZpnPftijBvhvfyqajhVxBxe1wZ4QnV1
         uwftG7/wuUftUqtD5ilTvBnGL9jTdlJkCM3b/S5EtegIZ4/+TinRyd2+T91eKgbD5p05
         /G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213554; x=1742818354;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XgQI7i+glIQS/JWP7XVCA4jeAmkUf5EqjBge8pBC6Ps=;
        b=tqxtyYVOXDu4JUGL9ZzCZMgT4gtw7Be3+RUMVQFyzv5vzjAsepefQVcZFcAmf6EFnM
         Uz9OjkX5nl60PKMo8pOdmASEBI6TY3a2kdsT24L2phPOqXsplun7wtyMNbNw5ByiV/3G
         R7erZZPWqJsTM40SSiIrNzYS1sJUPHvSSiRtlMgBepsvWmWzqC/QSek37A+Z4IfFMJVS
         c4zEtiUqgWfzN7B8MI4EdW32OehgEJ7TV5L+w4VdaJra2p3EPHBDitnN8kKfthyn9BxC
         VCQocvBJ4xqP8hd9M2s5kU6Pz6C/DaTClQgy6yTuSdV8Q3IA9/1Z34zHlP1hJ9LIsP64
         VXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1aTeQl59pF2e5wACipbO/axgLqrC41H3PozbscLIcTgYZhHWkaxLvM0Inovhxl9/sQBQ4Q5GgYiLyTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLwW9kH/caWwZN+8M5JJBwRjBkBdIsKoz7Vexgb7hTJSX5jLkd
	bZ48SvKCs+pHsaTccoiewRwIxKVBBkFTzNkAlQnK1B6OzjKVs+ZU4ihBaTO2KwC9FFY22FHAmp2
	D
X-Gm-Gg: ASbGncv9FT8ykAlIl55V7uThyVGJ2vmHttzRSfpGDBmsvSYljtki4Mkb5vBVAI3AeiE
	t91RnGVZOqwp+LZsinDZuPK64DVbI2+EMcKy7bLvK1A7EhE/1cE/TN6/h3eF9jMeF7w5yGDrBkL
	kgF4VXtw5VWaXDv0Ghj1I9U1LG06eohX4x4L8PtCoKY9btwIntXZOsPmYknS8xRZ9B3QKHmSRoz
	8By3tXlKEU74wKE+8VYNBHSI1ewNH5+iQd5nO6QBiIVdxmlNDcPWV1zdLuD8XiP78chfBZG2tCz
	ZOEkW7Gynp7+N+IYs3A+0fwUn8VeXDmT4w/c7LM4v4uEapd4B0ixjbQY4h3r8K0tf2dnS54TODi
	HMtdTRXZnVt8cIQ==
X-Google-Smtp-Source: AGHT+IGkBMivzQV4mRjAFxSl5hkbzmyy3jCErKcn7Cl5GDE/j11zVkAXm1oq3i12rfExH1BTJTH/vg==
X-Received: by 2002:a05:6402:518a:b0:5e5:3643:c8b5 with SMTP id 4fb4d7f45d1cf-5e8a080aa09mr12579753a12.30.1742213554535;
        Mon, 17 Mar 2025 05:12:34 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b0232sm6033780a12.38.2025.03.17.05.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 13:12:33 +0100
Message-Id: <D8IJ5TEHREW1.2FK88ACT1JPYQ@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm6350: Add OPP table support to
 UFSHC
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com>
 <cddcd851-5e8c-4202-baad-e56a09d5775a@oss.qualcomm.com>
In-Reply-To: <cddcd851-5e8c-4202-baad-e56a09d5775a@oss.qualcomm.com>

Hi Konrad,

On Fri Mar 14, 2025 at 11:08 PM CET, Konrad Dybcio wrote:
> On 3/14/25 10:17 AM, Luca Weiss wrote:
>> UFS host controller, when scaling gears, should choose appropriate
>> performance state of RPMh power domain controller along with clock
>> frequency. So let's add the OPP table support to specify both clock
>> frequency and RPMh performance states replacing the old "freq-table-hz"
>> property.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> [...]
>
>> +
>> +			ufs_opp_table: opp-table {
>> +				compatible =3D "operating-points-v2";
>> +
>> +				opp-50000000 {
>> +					opp-hz =3D /bits/ 64 <50000000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <37500000>,
>
> This rate on this clk requires opp_svs (not low_svs)

Not sure where you're seeing this?

This is from my msm-4.19 tree:

gcc_ufs_phy_axi_clk_src:
    .rate_max =3D (unsigned long[VDD_NUM]) { [VDD_LOWER] =3D 50000000,
gcc_ufs_phy_unipro_core_clk_src:
    .rate_max =3D (unsigned long[VDD_NUM]) { [VDD_LOWER] =3D 37500000,
gcc_ufs_phy_ice_core_clk_src:
    .rate_max =3D (unsigned long[VDD_NUM]) { [VDD_LOWER] =3D 75000000,

[VDD_LOWER] =3D RPMH_REGULATOR_LEVEL_LOW_SVS,

My intepretation for this is we need low_svs?

Regards
Luca

>
> with that:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

