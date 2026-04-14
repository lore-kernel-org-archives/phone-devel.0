Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6107423E358
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 18:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192311; cv=none; b=ekELMtolR+frG3KouCklXXSGIUj0XXHfvuoDAJQl/S1Um3LUc7Yn7k408CT4UuVs1RFhFwUPqWj6G1VtUhybl2yB1aqOh6jcYXrdBpdzsj5kCtJnNaZsb/mWOTJQVBFyGSO7vAtNY5uUKk5AilofPQw4cMT5XkUCPvURJqo3/5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192311; c=relaxed/simple;
	bh=tn+dTXAjb8W6N8RakVv8gZBrvorEtqpgp+TENHJrjMM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qvq8+T4WxMyyI4uVuat75Gu7OxnwXbn0/SnF4PbbCCIR7YNCPuj1ts6SYNUMpOE4k/xyF4NzGtdKMkZxXEh6i4ifZhWNoASV4M8IPzZUzGDChTRM9j3TcaXNQl87N29ROWQnpE2gPO8fJb5ZKHCnavk8xTqtxoGwKjzzREcQe6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=DnJ+IvAn; arc=none smtp.client-ip=185.70.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="DnJ+IvAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1776192286; x=1776451486;
	bh=tn+dTXAjb8W6N8RakVv8gZBrvorEtqpgp+TENHJrjMM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DnJ+IvAnKWv0gepPVq3jdSaanf3zf9H3fAdg2Z/LxbEkYRJpGfHvm3lM8CZtMY5/x
	 g4hz4pXqLVfNCfl4GxZ43wiJ5Jv8C97CkfxCuv/OZENhjkknguuAlA7CiKe8MklxFj
	 2enYiELeOF7Rrhm4fTabp1An/9LztPR+soko32TBFVQdJUF6/M2esAiR0rMVoeRX4J
	 ZAkHcLMfO5RwYDyAw2/wSJ4G+iD3nmnh4zkiJ1g7u2KUECpqI4/c4RmPyX7NudLrUD
	 bLk1WiAhpVbpkkVpX4UwN57yBoE31W5K3VwJRxExeXJjh2Xxb8S8d9a+1mfsQN3oqW
	 VAyFnLnPPXgfw==
Date: Tue, 14 Apr 2026 18:44:41 +0000
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, "Lin, Meng-Bo" <linmengbo06890@proton.me>
Subject: [PATCH 0/2] arm64: dts: qcom: msm8916-panasonic-eluga-u2: add initial device tree
Message-ID: <20260414184429.168612-1-linmengbo06890@proton.me>
Feedback-ID: 112742687:user:proton
X-Pm-Message-ID: 2cbf5ead8d24619b0b34c362484eeb6b031f32e8
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Panasonic ELUGA U2 is a phone using the MSM8916 SoC released in 2015.

Add a device tree for with initial support for:

- GPIO keys
- GPIO LEDs
- pm8916-vibrator
- SDHCI (internal and external storage)
- USB Device Mode
- UART
- Regulators

