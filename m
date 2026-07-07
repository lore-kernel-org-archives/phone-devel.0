Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C77309F08;
	Tue,  7 Jul 2026 01:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387670; cv=none; b=Ai3gVKNCG0rk8lkKDmOznbTcgW7rWlBTFa161a2i2ecokwJI4XsFikS6bGYtwyGMtp4YM+TsWANjLMTDFKFcd6wxIMudJiBgrVbClpbpVMcgaIPLdAyVbgv9E6/hj80KEXr8EEhHkipxnQ+i9yJFPynfKxMEvmij/Vg5e820vLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387670; c=relaxed/simple;
	bh=/9Zrv5H2UbhenF5onQ5RdlhvRTMB+k4wCkZdB6tgFWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KkpYXcyiGbku3W6dox+L97McyGZ9EHaeBYyHPPVOMAjzZOeSjTA9OEBqWv6gyRgsyEYrU4M9Oqy8EZwRHVuNKtbOggYr+h3aqRWk1c6fI++DGKekd13C0wtSpVNzZkhnhrrrUJNAzBAvsLTuk5G+0s+et37PHVoZmZP+4b9dH1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYZ+VL5S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYZ+VL5S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF051F00ACA;
	Tue,  7 Jul 2026 01:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387666;
	bh=W9450x55yLfhh9ZbmQpNsTTte+SzmiJ8K3OcgsG4oTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oYZ+VL5SzKD/WoksOt5swcutRXEBQSHcfI6FGvDRHEt3HS6zBLA/Th1oQh3rQPm5/
	 zZF+LG+/HIe6ly6zkefeCmfWB+Vk9akfRLXktzmupIrPjAROi7x8JA38RuSnBnBwlI
	 5sQUyeYKa/RTJEBKzov8QlAaT2IXMxVT/NZ0OFS1a7v6IlvqwvBoVvpnNfzEkiqgn6
	 XVrS4+5i5P8HBTkc94rwoFg1T/JWftLe6ao8htEGvzALJbeVwIwSEoroTnISoyBIbh
	 IZKHljGMLsMTL52Z5TvB77D6WBU1gachYKEYhwRY0u/yXJ19UaIoX+sW7bSMgQfv89
	 /uz/PVYl4GRtw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Val Packett <val@packett.cool>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 1/2] dt-bindings: arm: qcom: Add SM7325 Motorola Edge 30 (dubai)
Date: Mon,  6 Jul 2026 20:27:28 -0500
Message-ID: <178338764568.1558388.8423038598017179703.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506212319.682749-1-val@packett.cool>
References: <20260506212319.682749-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 06 May 2026 18:16:52 -0300, Val Packett wrote:
> Motorola Edge 30 (motorola,dubai) is a smartphone based on the
> SM7325 SoC.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: Add Motorola Edge 30 (dubai) DTS
      commit: 12975c0f09c58ccf305b1383131790ea3cf6cedb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
