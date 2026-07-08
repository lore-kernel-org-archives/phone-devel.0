Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC7B48AE3D;
	Wed,  8 Jul 2026 14:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522633; cv=none; b=cMt9wlJN5yqhqzWY/TxGEmlRwpUYstFvmBqLl/Go0N9+0gmx2RfdyDYrmxUdqp4lWnzOqr43nlNR3t1D17Kh+mWwJ0Q5slhi1mfVMBqk4mVtfb/Q2EmTZEI9PH0XIol0LGzyGSHpevTNmMltpE2UaGi8HX3+DahwJezQf/5y+2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522633; c=relaxed/simple;
	bh=KHvpPBJ9g9Gg1lCuGqlfBAlVJKW1ZkacfwGZx5h7TqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X7cCo+i7U2WK8iW+t3ojmtgFl/8+KsZXKnyPgXrbNreKQYgbT346rpZuJiZyx1/nnpZBM27TVIe7szu+8vgJqOhhQC0WUsfe4AhisWNQgTTcZJTNFS0Ps9S2Ofu05eE8Ov4YYxC2JI0L/77ROKD43rXtkn4P8tMh+4zcgIP5lTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUqI4lvo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUqI4lvo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FC41F00A3A;
	Wed,  8 Jul 2026 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522632;
	bh=htW2xuaAsxZUmNWQEg3/DdzPn68br+nF6JQkk4jdEXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lUqI4lvo4WxTi0dplNHvINUnRx9nowpL4ZVYBr4u+HLSvYluWlCMBfvBPJp5FVROn
	 bL4aj5PFzDt2ch9fKK3yQMDfTaqmdEQ/fcbjNCexlPKKnYcxAWrUUm0NGe/Ri747+A
	 ZDha3fe0DpATLSBfkmrkjKe1rUcHxGp12/VMAXLpU0L4gwSJowz6pjnVtv58NRli6v
	 S482eXJag3yKM1p2DVPGXfKaDR4OA/GGw9LYXQGTLxfho9g/ddkMOS6S1TPHr69D13
	 QFoeL/qh0FjMP9fvPBojmi8+YzRMBnRA1KzOx10pNGA3CQv869egk+BGFWxUs3D9to
	 QvDnZ67PSbs0g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 0/2] Convert qcm6490 framebuffers to use memory-region
Date: Wed,  8 Jul 2026 09:56:13 -0500
Message-ID: <178352261578.2235436.1819010224401346759.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260607-shift8-fb-v1-0-72b9dac25f4a@ixit.cz>
References: <20260607-shift8-fb-v1-0-72b9dac25f4a@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 07 Jun 2026 16:12:17 +0200, David Heidelberg wrote:
> Now that upstream u-boot recognize it, no reason to not do.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: qcm6490-shift-otter: Convert fb to use memory-region
      commit: 97c5fe2c932bfb1857f0f29e2f1389a20264c304
[2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Convert fb to use memory-region
      commit: dcef71a03f5bb375a5da48b666ad47c6c8855278

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
