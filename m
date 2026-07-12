Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315F833F5B6;
	Sun, 12 Jul 2026 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868875; cv=none; b=usr9h5aA4eKBtlTjpjWgEgf2DL9FdA3LCUc1Dyv4wm3dAcVsTlohg7PwSwqAB8BtzEFcBX/v0IYFpawXrIXmffVnx7S6UXdKNQ8/Ymzcw14pxXB46TlK5C39QZdIOpnRYa29U1gCYNNIQZnpfYq/h5bJvMmUNaThKpTO8plyzT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868875; c=relaxed/simple;
	bh=Ki92rlySzJj0H+WmmjjeITvq6BF017pW6876DOtGDdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KiCtw01+2ysk7RNexYnIZvGjog5khqa6QuCKeAWdnxynAsPudnl2C8MTW0u72c+rGLIxmmytGYHiFsfJYItdnP432sqQFtTZfkIKUU7tthOOxAFolwnzQ5xlwSgKdVvMlFztE77J+wYqc8ONoUwb17XMJBlNGFx9np8qMrsOEdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kkhexDtu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkhexDtu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63B81F000E9;
	Sun, 12 Jul 2026 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783868873;
	bh=101y6LiGHfX9NEhSyMTD995wgFcFQDJmnqIAzlV7K4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kkhexDtuikZisA1jceTancKKfISLEIypMvoCVn9HRbmne2CabM8r77HcHM9THO/BK
	 2xqjvfgAVh2D3gxnH3nTbXJ3PdYb/1FWiitZTiQM5DEhGQKEitf60RWXSbsim3tKps
	 lBk3TvmQkAQp8ikYhpJBpPzS1FEMHeTvPm3JufAr76IV8ua5F+0AiqTiFw4IeBR3UN
	 GlxVrp4WAQExN+invJYsc2GGuDQOGfXdBCZL0X0Z/mFGf20yQuFMnBsqdjxljNSlnq
	 t6ViDTBnBYA8L5eY3n8E39iyqtj4wnZ33P90D3w4wHoa32l66RYTzG2ZAfqdbt1VXl
	 POKQFTIQgJNBA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos: Add reset for sdhc_2
Date: Sun, 12 Jul 2026 10:07:49 -0500
Message-ID: <178386886745.278077.16422029437667124931.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>
References: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 Jul 2026 11:53:57 +0200, Luca Weiss wrote:
> Add the missing reset (BCR) for sdhc_2.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: milos: Add reset for sdhc_2
      commit: ab07ee0b1b29ce2672ae3b9ca208033c3ada12c2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
