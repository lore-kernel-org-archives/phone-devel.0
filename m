Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB091378D64
	for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 22:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884340; cv=none; b=YBCVtFiWKu7wp/7Lco68bouUeMKK/qvMdxiF/z1kF51X3jRldI/ec2wOzkUf+n39YCBmGRXNOo1BLX5jYMvImIRin6fueR/AjvWfw/AzfLU51NuXGfLAzC0zgLqaE0+hFqSEqlxhYaBZgUtJ/EtaOyB5EgHe0yMLuCsV6l/MRxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884340; c=relaxed/simple;
	bh=Ed4Q4XrhNRzyT+p/QgOVPiCNTuXhxXiT3B34lnOeduk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPTE6I/gfBi8ExjrJf4z1HaDAd5oM2W303rDNu5Gh5T4azu97a++HDSKyXWZkDbWVUDQWjsyfJvYxEYVpOFy68/QOg2N3rgorfOUHJRerRRJBN4sUh6FPDyUnSwAMs1EmX5qVvIiv+zU9z4o417DQmfZqBt4CJOZqD8iR/ycODw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=pIiZ8b+t; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="pIiZ8b+t"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1771884327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xAPHXUixVxqgYuhALMwpHU6wem0WmvlLkj2qLrzlvao=;
	b=pIiZ8b+tCkN3qyPnBEwWxzUITuhM+z0rspXQIYavIGXNiNUtnhAeIU8lxNY4o1OQg2JCi4
	e4UGAgVnXQ2k+Hk6YoKEXUZvHnWIXzH5+9Nf4ZYoeg5v0esdGjrX953obLcrZsKQ4gvTCO
	aaUWkJ3KZDHehm5M4oN39j6asY/KHsXsvN93/xyqurCvxMereoohzHDq0C5N2Uewtj5n/H
	O38qzfMgu3Ifrw236Zy5CHYviMKCe5rdIODa3P4bn70ab1UlnzCBF5SN3xZQV9FdcsDj/A
	2Fp1G6HCojxXSuKcpzB99D4PfSCIfe7l44tw+6Sl+wvEDFTaqMw2KkNqbEK/XA==
From: Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Max McNamee <maxmcnamee@proton.me>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	~postmarketos/upstreaming@lists.sr.ht,
	Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
Subject: [PATCH 0/3] arm64: dts: qcom: msm8916-samsung-coreprimeltevzw: add device tree
Date: Mon, 23 Feb 2026 22:05:11 +0000
Message-ID: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Samsung Galaxy Core Prime Verizon Wireless is a phone based on MSM8916.
They are similar to the other Samsung devices based on MSM8916 with only a
few minor differences.

The device trees contain initial support with:
 - GPIO keys
 - Regulator haptic
 - SDHCI (internal and external storage)
 - USB Device Mode
 - UART (on USB connector via the SM5502 MUIC)
 - WCNSS (WiFi/BT)
 - Regulators
 - QDSP6 audio
 - Speaker/earpiece/headphones/microphones via digital/analog codec in
   MSM8916/PM8916
 - WWAN Internet via BAM-DMUX
 - PMIC and charger
 - Touchscreen

There are different variants of Core Prime, with some differences in
NFC and MUIC.

The common parts are shared in
msm8916-samsung-fortuna-common.dtsi and msm8916-samsung-rossa-common.dtsi
to reduce duplication.

MUIC varies on fortuna/rossa devices, which could be either SM5502 or
SM5504. Move SM5504 from msm8916-samsung-rossa-common to
msm8916-samsung-fortuna-common and refactor MUIC.

Disable MUIC by default in msm8916-samsung-fortuna-common, and explicitly
specify them in each fortuna/rossa board.
