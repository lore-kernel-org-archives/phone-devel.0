Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A1C37649B;
	Fri, 17 Jul 2026 03:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784258618; cv=none; b=pE5MPxAn47F3eBg3afxng6MGvYRQUDLPRO3d1JngfO+iEEMs9Ol34XcJljB6aURo1FivWzn2qXeJIvV+5tD/tS5p6xQy9pJ/NMI74dNwI4crKAvIELLwGAbqCMb7jMi2xhl1mb6j9PUeNojU7/qcceFa4pmL/F4q4GOgG08+95o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784258618; c=relaxed/simple;
	bh=Yvt4bXaLPLcmGUcbEuDtQOHNV52FCCWtiWq5ro29HBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WV/KAz3hjhesaWILrK7druD42EKaVWoT9S4O7dSH1S+0kdsgjeW9UepoPfkld8HNLUNU6mqUgb3CA4Jr4q9OJ8Df5LzEG2bxz3ig3n5Xa4h9oLKO7ToaUVvo3PN6kTZrj3ADPGiAihvagm94e1siuY1ehaSfNLrNgz4DoNJqRkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4TPmGiz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4TPmGiz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DAD1F00A3E;
	Fri, 17 Jul 2026 03:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784258616;
	bh=/VqzxVCDFmwFmPQS1FYO69tNbNI+exaelWIFLylNn7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E4TPmGizNZGASZCJWCSPS9J4GQ4CCI/DTjSURZfBdiM1SPUN0p2tXYSQ9Ivhk/5Ux
	 GNSiJ4GJQS5ftSOtt6MiVfjksfxCJDVZC6C7yzkt2/okleSyCOUZq7EB+AcnR3C7x9
	 nbIG2Ky0hJvwVFfFGSkPCv0l0Itk1D3ZO9UqViacpwix36fSlaV+1ai0HF5ylIOQ9Z
	 l1KAUXHdndLBSxUZyQerEzszXA7JPwYui/Cy9/z7fpKxXEYcEM7K5/2XNykozG5/8S
	 i/hVC2o4o/9HX/z/ePZfBmgR7yvfdiIhwIuKJc3A6NBjyblrwEPIWvN4cVpjZhpa5l
	 aYF2/KHqXackQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] SM8450 QoL changes (dts)
Date: Thu, 16 Jul 2026 22:23:25 -0500
Message-ID: <178425854592.1084804.16144771627314071470.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711-sm8450-qol-dts-v2-0-5eb2e86468c5@proton.me>
References: <20260711-sm8450-qol-dts-v2-0-5eb2e86468c5@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Jul 2026 23:12:26 -0400, Esteban Urrutia wrote:
> These patches focus on correcting some details on the DTS for the SM8450
> SoC.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sm8450: Remove unneeded reserved memory nodes
      commit: 0ed8261e0ebdac5f1f08dcbfc209efe36937ed2d
[2/2] arm64: dts: qcom: sm8450: Add mode-switch property to qmpphy
      commit: 8a2b4481b66c802af293e55eee07406971d5aa7b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
