Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66DE3BB693;
	Fri,  7 Aug 2026 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106073; cv=none; b=UV5ZymXpf2grXaA6IpaElO88MDr9U9Gtx2h4miMpuVwG7CiJj2pli9Oak9Wh25wePXAbYJxmQboqXuvzhW1wXejX/H28Z0t61uqlosPdp23d9qRlaNc3uYDYQdyrNScD32YAjk+fxEHKXidVcU+R73CaO+Y/Mpuq9E2dBUD1ij8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106073; c=relaxed/simple;
	bh=x5VmvzwVKIjLCpgyaVpP90QLSK/4y4byYJwhmNZLLxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l3/vGL4Ql00Su2NH4kxvIjs9yDSeELLfo8Va9tZEWg1PdBMO+TMAp5pnFBzgTntMhfclJFAdVCpj4T9QmVCkTPsVymwVHiSdFp3M/WII+V83TnNKvbv9CCYKYfIHSHulUl7IjzcexEdi1Fttg6SLY5QApq5k2+d8WjF637peNOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCxiro5M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCxiro5M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF721F01559;
	Fri,  7 Aug 2026 12:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786106049;
	bh=i6qYanLTFqd0IqbWzuK+Yek81Ia/RevJ2aCxp8vXMus=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dCxiro5MnrvGbrFQiNTvE1hDoMZzcvq2h55KvvcLx43rpuW+FmNxOWIZWrLWeDsZu
	 PLDVOaK/NPs4Uj2V8bc0b9QAe6NZDiMywzGrlzaW0MtH4LHqW+Cu4BkRC61cG2Lkdv
	 Y6q8W0yQRDuux3UhgsFznkUs23ZG679egnNNhPDSJL3vV+cf+Srxnibf6Qz3mNNIoa
	 6tso2laxct35C0hoW0XSGOf/ePAGK6lTmlHV5HMVGj2fMOVDN7QUs3g2RUs5YtZsqE
	 S/QJBb41Z+W1RS7h9Xa0zEQkQjQAtEpTRy52M3/KV5g01DjwSai2N491pFrePrusGU
	 GSXRwkd+ObKzg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org
In-Reply-To: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
References: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
Subject: Re: [PATCH v2 0/3] Initial PCIe0 PHY support for SM8475
Message-Id: <178610604511.740291.3909806705219410355.b4-ty@kernel.org>
Date: Fri, 07 Aug 2026 18:04:05 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 15 Jul 2026 02:37:45 -0400, Esteban Urrutia wrote:
> This series adds support for the PCIe0 PHY found in the SM8475 SoC.
> The initialization sequence varies noticeably when compared to the one used
> in the SM8450 SoC, hence the need to add support for this PHY.
> 
> 

Applied, thanks!

[1/3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add SM8475 QMP PHY
      commit: bae047e91213a7b8f86b70f0f48f38374a73d5ea
[2/3] phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5 offsets
      commit: f8b4493d5e7e19682abcf538a9faad012b5ef69e
[3/3] phy: qcom: qmp-pcie: Add support for SM8475 Gen3x1 PCIe0 port
      commit: 9e953732c3ed02b19698bf4af05396a3573681e1

Best regards,
-- 
~Vinod


