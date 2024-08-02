Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988EE3D6A
	for <phone-devel@vger.kernel.org>; Fri,  2 Aug 2024 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722586054; cv=none; b=nTXiLvAe5jXouE3hrk+H0r0QknOqVaiWAvtGV7hYi3JQC1a0G7LZ2+Ybo7Qk2wUBsJLLrCGpy7xEAJ/cmiu4JL0c0y3XF9RS2WHUMSSepnPOTVS1J8/rtUv2E6llj+TnkOz1mqT31KYuOJfOL/H9WZjOc2GC8cLtDVVVEHQmRFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722586054; c=relaxed/simple;
	bh=6bRNDTSn7NG2m4UUq9bRnjAmIn1wnrCrKqnIjDHhxNI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GRDOKOR/KToftCLwHNC3YNaiuXeg6VmuBJIZcM75tyFYCHlcb/wL7AWL/Nol7//xDdy2YS57Lu5TvT3G6qiuhd18bbzms8Leh005Rz97lPSyoaZUVB824ATX8NC/SQAvG8EcSD7G+sEukuYvWLVdRTkOtE39u7Kd+HX7m0vh5b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=P6ocFeae; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="P6ocFeae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722586043; x=1722845243;
	bh=Wy+SqFUYOWwBwGRfuKWoUvPm1nL0Kd/BTvULVmw6+eA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=P6ocFeae4F+a1VMqHe9TPi+dAdTO9cJedVbZjZmZJVEkTABbqufNORCiW+wPgcgKO
	 IJDXiyB1X1+5hDEMuMHnRsVePEYZRK6vDm7wFp1GVJw3xMLRXYrPwekLIzxkOk9Rzd
	 H1IuVu1MmKZ4WydnjjDot2gfGxxhY18ZY5/uwNX2jgWSnUfp2D+22U9VMRubMVIgeQ
	 qec3TyZ9ST5iApHNfq7LYyrod6KcFS28/QrBYk/b1FGkLIXR+Llidk4Xq6zfDjs8eJ
	 fLRkQYCXoXP0w305I7/hH3c1ppuRXsfgSoEgnzoDiTjBl2sq+ZzAmgCOUPqMYExGHx
	 nEPrr2KZHW05w==
Date: Fri, 02 Aug 2024 08:07:16 +0000
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 0/2] arm64: dts: qcom: msm8916-samsung-j3ltetw: Add initial device tree
Message-ID: <20240802080701.3643-1-linmengbo06890@proton.me>
Feedback-ID: 112742687:user:proton
X-Pm-Message-ID: e48e463b51e86a9f7300844944fc80b772208d9f
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The dts and dtsi add support for msm8916 variant of Samsung Galaxy J3
SM-J320YZ smartphone released in 2016.

Add a device tree for SM-J320YZ with initial support for:

- GPIO keys
- SDHCI (internal and external storage)
- USB Device Mode
- UART (on USB connector via the SM5703 MUIC)
- WCNSS (WiFi/BT)
- Regulators
- QDSP6 audio
- Speaker/earpiece/headphones/microphones via digital/analog codec in
  MSM8916/PM8916
- WWAN Internet via BAM-DMUX
- Touchscreen

There are different variants of J3, with some differences in MUIC, sensor,
NFC and touch key I2C buses.

The common parts are shared in msm8916-samsung-j3-common.dtsi to reduce
duplication.

