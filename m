Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A623769ED;
	Fri, 31 Jul 2026 03:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468297; cv=none; b=Nb0qbxmYfcxIvxXSlwLfhRoTZRKF6Bq0WhXn5qbB/Tuc7/M+l6tHMl336D8cPBMl5r6s9hE+wrVv776ytddZEtX21WxMUgqDbA9PDjR+GVVbSj7w2z2Sx2R/xOeAFHMzQVlK+EnWK/yQcXy4CXI9lMEwnbw/SVdb5b2/lG605z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468297; c=relaxed/simple;
	bh=oH4Oci8Or0271jFaIdhDS2CLdztS3bI06KYEPHfn7ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qnt3kGpUcidzn2PJHjSs+lCR30MckxsqHCKcdD6LRARVqLlGPDnk+enMDTARE1aF0pR1A1409Ml/9mIot2CAJ+GFbW0Gl2pEPgaYxRsN0YmnGzGyzqeYxm5dys4IVifsthkQ5iCTgDKp4GqimfTqAKXlyH7smlUVxau3x+80UJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGb/R+NR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGb/R+NR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA35B1F000E9;
	Fri, 31 Jul 2026 03:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468295;
	bh=JCMWEHVi2ukWsupsFuOUAHvBPTZ47VB7i6mWh6muBFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cGb/R+NRqkymaUxTCObdRykh7hpWsZd2MVh1b0B1yPqea0zo4lZLSfM+DYiahhXLl
	 9OyBFa5zCnCulPkVwsr6n7EW0V/kGN2jejoiTfOlatl3oUMUvfC6Spmasu2w1xiq9c
	 +YRUSkDsKziIRXC1VRI56VJnJi9xE5YmHLht1Rei99gjvRMTY/7NdgGtVLNiS8OydJ
	 wo6LJGQ4e5X+mSWzaVhkhdxx3etkqcrVuUfPNrMxZarB5rIU3oq7YA9E4X/4DB7WaT
	 jgmxmd0bXrezqrVJiEMQsShMUll96IUKTMt4z3Haa1S+VqsMJ4zRYCDL9T9M/kgPTq
	 gACLsa8gG9CGw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biswapriyo Nath <nathbappai@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add vbus-supply in Type-C connector
Date: Thu, 30 Jul 2026 22:24:28 -0500
Message-ID: <178546826825.316815.11744675708425403076.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260718-ginkgo-vbus-typec-v1-1-d5ed0aa6b78b@gmail.com>
References: <20260718-ginkgo-vbus-typec-v1-1-d5ed0aa6b78b@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 18 Jul 2026 15:21:25 +0000, Biswapriyo Nath wrote:
> VBUS supply property was moved from pmi632 typec node to USB-C connector.
> This fixes the following warning in kernel message.
> pmic@2:typec@1500: supply vdd-vbus not found, using dummy regulator
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add vbus-supply in Type-C connector
      commit: a44338975cf80aa0aed629f5c6495aa18250897f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
