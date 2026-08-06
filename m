Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C09227BF93;
	Thu,  6 Aug 2026 16:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033579; cv=none; b=iVCwoYhYqYeS4jAgMQOZkwmkLPstSiF3vpvUQsNk2f7rN9fPVsjgIVnaRKDTw7UrEPG+VIOgHk6JS/FdEdTXiIOf64LDdCBExcPD5AKOG6q0FqdBO8gAxznRj/SIrjbArDniULqBVAaLTYAHm8zKwYxs/Ax9zjHddKAs6srzYb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033579; c=relaxed/simple;
	bh=K32lkY0iyjQ6ltPX22VBJZISyAW+jJ2aq/jWcL6FMts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XkeIcDZFD4yCLOGlk1ci88YoMnkOvjkr9Owerip39YlkMl0g4xz/+5qOjg6b2BytvX7mVolucS3IYbQ1wAZqg/eqpG4XYm6qJRz4gLtHw+jDSYDJLYRjjZS2j2QRsj8TrplQih34hdmQhMzq4Lwb1wcMCeNpCQkNl/7iXONq81M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2YXq+Ks; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2YXq+Ks"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D751F00A3A;
	Thu,  6 Aug 2026 16:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786033577;
	bh=J7FU8gW2VUhAfd7BYGs2hAuYby6wONMtKH3laYXT+I8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=I2YXq+KsUedHGxOYgPSJ3xf9cpbYMZaMo1D8hCe4nhKzpv+LG4lBfJNkL7RpDYn7R
	 rIcXmbnV7SVUCFuyXU4Iq4L0E+ID59GNKgj5fU/Kp7Us3PLk/djskQLxa4kYveyi7X
	 8ym28if7WAjeswo8sbTobs0EZC6inBE3w1iqHhlleSWibeAdh1BrP0UP7VWNkS8BaN
	 D/VMGKaHUl7ggoaWDsBNKT+IEStQZkbjEKXO0dFBaFja8PZFbQEcO4vDwmKdW+Oh7X
	 w7YbAZemHT5o109PqL2uS5wCytfs/C2LVf5iByIr2poT9dzBpqkVsi20qUJW4PKhh3
	 Hg5kvM1GH6QUA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260804-sm8475-bup-usbss-v3-0-9a5b9ebf62de@proton.me>
References: <20260804-sm8475-bup-usbss-v3-0-9a5b9ebf62de@proton.me>
Subject: Re: [PATCH RESEND v3 0/2] Initial QMP USB PHY support for SM8475
Message-Id: <178603357411.674490.11520339407340817802.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 21:56:14 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 04 Aug 2026 14:06:18 -0400, Esteban Urrutia wrote:
> Based on the following patch:
> [1] https://lore.kernel.org/all/20260711-sm8450-qol-qmp-v2-2-d14353bd6ff4@proton.me/
> 
> This series adds support for the QMP USB PHY found in the SM8475 SoC.
> The initialization sequence varies noticeably when compared to the one
> used in the SM8450 SoC, hence the need to add support for this PHY.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8475 QMP PHY
      commit: f8bb67fa3651d494427194c1e283886ad4cdbde0
[2/2] phy: qcom: qmp-combo: Add SM8475 support
      commit: 9583243a524c0ea4dd08541900ab2c7da95ce13f

Best regards,
-- 
~Vinod


