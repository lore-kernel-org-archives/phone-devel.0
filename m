Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14EB345741;
	Thu,  7 May 2026 20:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186122; cv=none; b=XnZhxjEijJHM+tET68yp/29YnsH+gxpGJsDgd+3urnFMLC7IhbiFTr/IrMWpKCZf6IAojvfHqm0epQjGDwhzGstzF5ecxd5zoghlGvwOR69bZzpZsdNtKkBNEQO05RH/u7V9x5gCzgMC0tSOtILkVKlpdbZ2nZnRoDOCEzRV5qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186122; c=relaxed/simple;
	bh=pFaClC15A5h5LUxiUTMKOYJdhEY+xd8nzrtmaKHEWUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bnQnQdpdjz4EJ3wDTA4m5AW2K6RRPQHigQ5ERsj5ohxkMFaVtk6ONLA5ihwR49Yb9MYYrkUMWEkpoBtl23EdNfU2gmL1RZymVLEHWV+MdrBFG2wlIAyxVT437EwPOcesE+ZJ3wFmrJkhmwNjHrNkIInPlVWP5Vrc9/iCIAdxCMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzUU5UXX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzUU5UXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3906C2BCC9;
	Thu,  7 May 2026 20:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186121;
	bh=pFaClC15A5h5LUxiUTMKOYJdhEY+xd8nzrtmaKHEWUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JzUU5UXX5wSYlnNfXgszAc7TvILW8ETeeN811kNIK3vF65q1U793fpkIVRO34Pd6I
	 uC57JzslFIOWalDcCds0tLSp0ubSVOnQyEMz5nHrTQvU7lhKm8lThuySUmRykCq7L0
	 /OE4SsxzRBAHdUyV5Qy8OO2m5yigCCCWdj9p3zmErFwf5DnRgmD0nG7oaWgGXVoCOR
	 4arC3RntCzbV2VFTi0ksRhPpfkpKbdlDjsd21+WqvN/MFSOKx24dF2gteqoNeOhUUL
	 C/S7zzdiYijWbuk9n+2+2nNww6N+xYnfW+T8NQN16lmSaDxQn95sGmG9Ls4138q6OM
	 W9rON2FdbJjLw==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Kamil=20Go=C5=82da?= <kamil.golda@protonmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	Yedaya Katsman <yedaya.ka@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/3] Add support for the Samsung S6E8FCO DSI and M1906F9 display panel
Date: Thu,  7 May 2026 15:34:32 -0500
Message-ID: <177818605997.73000.9692910497119100760.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 14 Mar 2026 23:46:20 +0200, Yedaya Katsman wrote:
> This adds a driver to support the Samsung S6E8FCO DSI controller with the
> M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
> generated using linux-mdss-dsi-panel-driver-generator[0].
> 
> The mdss reset dependency makes the screen work more reliably.
> 
> [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel
      commit: 493cb869874cd301c370adf9a3f9577942c4f0f1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
