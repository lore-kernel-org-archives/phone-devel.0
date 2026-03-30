Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BFF38E5C8;
	Mon, 30 Mar 2026 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886525; cv=none; b=etCVyQrZlgo8QLZvpS9v+CBaYUiNr2MscDMax9TX8WzDt01aN7EiCdrWGqeQZVLKbCM+zp8espQk3toQlFv7waYyznoBaaVls75tpombXo9jgo6bfyc4jqbVBDvlx8lCdhKZh57yMRQjZC8mz4XmBulrE8fpN4Jpl/OPd/WgQho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886525; c=relaxed/simple;
	bh=92qAfw8U2FiSqrexzRwZBh0VWakwoPy46JfMNYgBTWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t1B7XY3Auc9M9fe79s+NpFS9LOMAeCezLbrn3Pb2xDLspsxOZdHAijvogwzz0zBhKilWaRK9gRQj1SsCJqEpurOhaVsaRYdg5wzWba2nNpbXE/IUxJHXBKQTDYSP9kwgrKeecZtQwSScZrdr/X0cHjkQ+1wFPDClOhy5IeDAd5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPDfuni4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPDfuni4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A38C2BCB2;
	Mon, 30 Mar 2026 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886525;
	bh=92qAfw8U2FiSqrexzRwZBh0VWakwoPy46JfMNYgBTWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qPDfuni4fhJt9kHgbhb1Q2l/f2udS413ZMI1LHM9c3zEbsD1/RqKCkzEuyXfbqytM
	 hR9sP1j3kwbaZI00QMu1jRWoJFkfsn94aD0kEYc/nYBx/KHCCYcyyIkBLuIVZfrqDt
	 CeKiBSAUQdWPBDUF5biiHccs6RXWZ6Iak8HvpBW2KJWjEgwkGNBPBpy548Wg0g94Nc
	 rpbrXHl59y7bKK2Dr7+FIEVTmyI5FU1yf8dGfdU4ezeJXthLnlPxJMiFhEZnsUELSK
	 U7ssR7oEy349cZnCaTJAHb2PuQS9rVb9R25jp18yyEUbqByAEVo2UCN4PJyUxUaZqp
	 JAoQjlWYoRRtw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Front camera enablement on Fairphone 5
Date: Mon, 30 Mar 2026 11:01:24 -0500
Message-ID: <177488647775.633011.11463914873995583752.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319-fp5-s5kjn1-v3-0-9cf4b8c09567@fairphone.com>
References: <20260319-fp5-s5kjn1-v3-0-9cf4b8c09567@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Mar 2026 16:36:27 +0100, Luca Weiss wrote:
> Since the Samsung S5KJN1 driver was upstreamed recently, we can enable
> the camera upstream by adding a few bits to dts.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl nodes by pins
      commit: e7fc3c46dc09c1c5f901f1a627d9bffc6321081c
[2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add front camera support
      commit: 1d44de258d34f33aadda67d69dae5a8427b9d2c7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
