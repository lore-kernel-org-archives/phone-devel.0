Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA8A35AC07;
	Sun,  5 Apr 2026 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418038; cv=none; b=iGO3AmeswkPDNUexNkMJh1FGhFlhpfkkbrM9/2PXWF7SKGOd3cG9nIEG+wyhC80Sp9rzSCAkgWxovJhwE3X3WZ6Fijw70eS+fx87VgC8bhqBffVOym6Q7JnciRqq8FsWTcXJnxUkTRs8gGiago/mtyFPz0NLp2f0DafFkXfv1fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418038; c=relaxed/simple;
	bh=t0c1Aj9x6oh9swEHELoQI+YWMFwmyHi/wBMgqgBqNBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ATX3+51JmZq3hYibsE+/ic1L722y+jbDrWE/lplxCJvTJE9Gkloy9+Asbi/XJBq1/N5yk7zrt8wZj2ycAriR0ZqjfAGq2X+HVJRPzlFdV8lY1CEqRHh+06ga8kOXNiHXV9sRxUsn+fvIohpwVzoSb+0p6Sf1SB6J1s914C89+/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFWckPmp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFWckPmp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF6CC2BCB0;
	Sun,  5 Apr 2026 19:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418037;
	bh=t0c1Aj9x6oh9swEHELoQI+YWMFwmyHi/wBMgqgBqNBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aFWckPmpRpoSChNlfVehoRcR2M6hOWFqQlj7UvIQMkRWh7fKyib64TycDGrNgEvvo
	 ILcOcNOhcREb7uFtozvXJWpiZOx1nRXZxSI2IRvbxV+xZYKFCLhwBihGvodT7U6cBp
	 OWcSVCtll8xQlRDLurizzGnTtnKcxCxsVNY1ag8+WGXNuGT3kP3wg7udmGd5eYUYL3
	 tq3g+Qi3/KEg+nI5K/hw7kcwZEg7b4cnuMiy9r/8ObUdAOQiNC2yc3NmAbh9PZWrzH
	 Nio/6mpRGSh76Sgv9m75qgx95CcJyFXjt4V4FpyJahIP4bLSae3u9rNSQuQmNq0U7i
	 2GATs+PYdAYLA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dylan Van Assche <me@dylanvanassche.be>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	Petr Hodina <phodina@protonmail.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Alexander Martinz <amartinz@shiftphones.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] SHIFT 6MQ SD-card support, improved responsivness of touchscreen, and codec
Date: Sun,  5 Apr 2026 14:40:17 -0500
Message-ID: <177541802154.2061229.10542831803796515827.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402-axolotl-misc-p1-v3-0-8934e9db6831@ixit.cz>
References: <20260402-axolotl-misc-p1-v3-0-8934e9db6831@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 02 Apr 2026 11:54:05 +0200, David Heidelberg wrote:
> I've tested that SD card and touchscreen works well, the codec does too,
> but for complete enablement needs soundcard support which isn't fully
> finished.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable sdcard
      commit: 338b4158e877f116d404262098bbdcd1eaf6fd88
[2/3] arm64: dts: qcom: sdm845-shift-axolotl: Set higher touchscreen i2c clock
      commit: 8a53d5aa0d1179ac14aa7da58351848c2e709dcc
[3/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable TFA9890 codec
      commit: 2b676b5a13d28eb038b4e54dae8e161a7be58d96

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
