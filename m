Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AD24ADDA9;
	Thu,  7 May 2026 20:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186115; cv=none; b=d6h/7bVjzWAZrKXljREK35H5ldeAHybi06o7hDPaP09oN3d1VycbUhm35oYPOkG/Fw5NDoFayxeuygFh2kTFGEjJnwpXH01Kuifla1/dImTlKrxSUc22hwcxAMuX9DxCUGF+6aCED6kdnvZ0+wKsGsn0EBxxPHjEXi9V8pImPaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186115; c=relaxed/simple;
	bh=sazAP2oVGZXfkGTv+FhIqQYVwPUI1cGv6nC8EixNI4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GuARWeCXgfw2RQWG7zuU8krnsGCQcaiADGdiejHS4u2H5XYQjBI4OsVGadGlEORjBv/36xK29G/8wS031RHXcz7w7jxAvsyai97xAH2IUI8FK//MvCKxlOXhB9md15PZEwkbCcsr4mQyTg3tO07A2Ts39EFXYvhO1g38rCREv7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/joN8l4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/joN8l4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6F3C2BCB2;
	Thu,  7 May 2026 20:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186115;
	bh=sazAP2oVGZXfkGTv+FhIqQYVwPUI1cGv6nC8EixNI4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S/joN8l4Ed94NcKBj/YtnyDm7Bhn8NeTTrroS+UzsBnuymweS0q0IGkRghxODj5es
	 ksz/CIEws6E1xYFb1GMZUPpqhHfYke09+5FUw+hw8utQgr0wARu/E0Jxx3suK0HMa1
	 YeULbwsxN5BXxqlVMpgiTH6dFS4IDclnqJ0xxBWQtFdDzpknsFNURkcLOkaWzNGLh1
	 I7xh0BJrqF6Am1KP/YLx0YsDHatH3rGunRvOwiBnypxIh2NcULg7eskutly9WhEgJn
	 2oKCEZO7FdKyS3q+UDH0sut5jgjehAVZL2TVWFhZeGMretoIBCwk3Ji2rJE3kZsqNw
	 rDmANMZyj8nJA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: arm: qcom: Add SM7325 Motorola Edge 30 (dubai)
Date: Thu,  7 May 2026 15:34:30 -0500
Message-ID: <177818606041.73000.17657106462085102010.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403054417.167917-1-val@packett.cool>
References: <20260403054417.167917-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 03 Apr 2026 02:33:08 -0300, Val Packett wrote:
> Motorola Edge 30 (motorola,dubai) is a smartphone based on the
> SM7325 SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add SM7325 Motorola Edge 30 (dubai)
      commit: 839d20f9f3da93f65c000187ee68387598bdecb5
[2/2] arm64: dts: qcom: Add Motorola Edge 30 (dubai) DTS
      commit: dd1316efdbc5a998b901b1c5f27da73d45060795

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
