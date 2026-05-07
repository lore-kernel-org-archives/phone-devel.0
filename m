Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FC04A1380;
	Thu,  7 May 2026 20:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186106; cv=none; b=KTrUVKO33DnEDC7Ol/KfcR60W7ePV1ZVHG+HxBmn2Ufmy8kG6gVugDHIm3JHoVmVwirGSJyo6TCfuJZqUndEtENo9Oa/41110nLwjQgWh1WArOYbeIR1coKA9IaOICmJg79/1/EG2p5kzwgAS7pJx51934KnVLZRWlkUEWix0bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186106; c=relaxed/simple;
	bh=YqgHUC8BZPzfiBmPqP8oKs7cYf0w8SqAWAmIa8zsr8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TQSX414gDu41krZVp817D54Ai6QvbaweVogQwbAc9IhcLj8CNvlzv0pjR4hvT4Xg1V37yJmUXu6bQmVP2Ib/TptK5TX6vYNNGTOaZtlq2rvre2SCFONLoNCncRUBoBW1+PcSdgwjxI3+cOEQe6BZexDTvgbRXaF0Tsa1/Yk2uj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTTQ///5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTTQ///5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2C7C2BCB2;
	Thu,  7 May 2026 20:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186105;
	bh=YqgHUC8BZPzfiBmPqP8oKs7cYf0w8SqAWAmIa8zsr8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hTTQ///5EBgHGp81hOixnYBLhJQIlOBzRtnupq8m3Ka0OXUuIc5+QE1wRijopKUNO
	 lJD+h7zy6leBDvIV6v6nsjJOXEPBzdN+WXcSbNWhLVqQZByMLoDpk8IYQPNAuiLQzD
	 9L2ik15YPFlu99Ydyw5gxIZTDvYqcFiGLqmYDMo/wH2FSUJvF92/jOtHTGkjAWu3h7
	 YYGEps+gLIzg04kd5sCPN5+l9Xm45vpF/OS8xcEKBh0KeSgxcgkSAtQACZs2LjBbzV
	 l7bpY5FZHwYKdjVuqzwgPw3uWZVOEmJQAnF79yDWlqh1/e2jkhdruhxc4mK4hcrS5r
	 EaXCw5CkT/Hmg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org
Subject: Re: (subset) [PATCH v11 0/7] media: i2c: IMX355 for the Pixel 3a
Date: Thu,  7 May 2026 15:34:25 -0500
Message-ID: <177818606009.73000.12591843446852575554.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 23 Mar 2026 22:01:25 -0400, Richard Acayan wrote:
> This adds support for the IMX355 in devicetree and adds support for the
> Pixel 3a front camera.
> 
> Changes since v10, 4/7 (https://lore.kernel.org/r/20260311020328.57976-1-mailingradian@gmail.com):
> - add data-lanes to dts (everyone's review retained) (7/7)
> 
> Changes since v9 (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com):
> - reject zero data-lanes (4/7)
> 
> [...]

Applied, thanks!

[5/7] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
      commit: cbdf1a61dde22c226a776d60ea5bff260b94f653
[6/7] arm64: dts: qcom: sdm670: add camera mclk pins
      commit: 86695909eab6bfa577bf68c615dbe852ba9c8197
[7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
      commit: 8d3a34d7890faa4d968b16e29c5c80e559291fd2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
