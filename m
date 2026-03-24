Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E19838B128;
	Tue, 24 Mar 2026 03:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321573; cv=none; b=EWR5mGkiRsPCnjFuc4fzSNQ2mTUyXYoASbuSEVTjaK199hG1yQx9g8By+ydCg932/LTJOsW2eWM0zHUF5jwciePDG+aDzCjaWPYoU0acDYZrNDTqThFuDX3GqkFEEZyzFIXwiwXe/GOZMm5HF3RJv3xZIuTeTjzErCCeT5/EkaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321573; c=relaxed/simple;
	bh=NGnTzMjN/dqkSDLJgCByshs6Dx+jkVyhRZMYumkhleQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MdbVxbKa2y1keWEqENZEqj8stKg+u2i0q1QL1JNyAn8TF5oYO/F0g4HKvONDhE85F8xBI05oS+mNvB/k77lF+y8DXK4X5eL010Hq9H1gJg6KseiaB31xysER7OZSpWYqNk9RROj3vyCayb0VA5+OelUOjBVwS3Ngrhu/OtSygac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cm7FQslR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cm7FQslR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A85C2BCB3;
	Tue, 24 Mar 2026 03:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321572;
	bh=NGnTzMjN/dqkSDLJgCByshs6Dx+jkVyhRZMYumkhleQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cm7FQslRHj+v2PwL8kl1Ky3oRFEvF2AgC0xNmQ2hUPneVFtjs+YRjipiBhWAdJCC+
	 s2fVmRsBYwEmxGHQ/whe9+YEbBvCjvxZPpQNV6LkrQKyhJA/LUyQ3D37zSffJEyirH
	 wcqoFbk0BGCQKqnzLUQSa6xNG4m5lAO6R1E8Xs2eD/5XFdVy1Yt+cuiaQrQh8QiQaE
	 kuzTpGqn1PrAWFRtQrIGaygCMaJSmdMx4SitRrky8jfMUDSKCSr4HLsW7Ib50S5ru7
	 vxP0TCQHDv2oZACLvLyf2SzIs34fuwLWZ3ZukJpO6R19bzXSqUPOL5ASgJaWTwNODJ
	 JBAPV0VA1NCAA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Enable UFS support on Milos
Date: Mon, 23 Mar 2026 22:05:55 -0500
Message-ID: <177432155637.28714.2511351512032518031.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319-milos-ufs-v3-0-b7c60bdd0d48@fairphone.com>
References: <20260319-milos-ufs-v3-0-b7c60bdd0d48@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Mar 2026 09:23:17 +0100, Luca Weiss wrote:
> Add inline-crypto-engine and UFS bindings & driver parts, then add them
> to milos dtsi and enable the UFS storage on Fairphone (Gen. 6).
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: milos: Add UFS nodes
      commit: 0b0d0b56308e51c6edc515bb39b383c769dacc04
[2/2] arm64: dts: qcom: milos-fairphone-fp6: Enable UFS
      commit: 93bb565b58bf4ef094eebf64cfdd240d4bad3bd1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
