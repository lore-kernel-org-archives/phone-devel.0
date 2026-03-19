Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BB93803C2;
	Thu, 19 Mar 2026 02:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888427; cv=none; b=taShVFAjdkj2hrlyRQXlyH655ceC2rGjgiXg1IjPboJh+pyQX90S2mmOo8jdc08LPBPJa3uA7en4+fqYOdvPKAqGnwYmBylAsBVgd4g8ceyAWlYjQnqZgFLSkkfBzfWWjQWmkfhPFSRTSHmsv3zDrOseGPmRH7GFItybd3uYCls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888427; c=relaxed/simple;
	bh=UDuHEoZB7I1gEmruXpe0UQwifU9+qcR3RDMVul5/JbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BnWCQgtBJlsRI6msTTQ961fQK81iuxbNWC1Yq0nglropwAsEX0pem51ju5wL7ZeT1SdqGQDa6tytJGos04Re7KJRMsWRwLgqtQ0sACXExSOUQAkwrWLkyg072RtSwYHIXCS+O4y2FYlsJNTroE2R7rQy5fvG+r3+e6DSB/HN6H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhfK9jdQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhfK9jdQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061F7C2BCB1;
	Thu, 19 Mar 2026 02:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888426;
	bh=UDuHEoZB7I1gEmruXpe0UQwifU9+qcR3RDMVul5/JbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MhfK9jdQ7TgRpvgAAG1DkwSxNTz0AtQUNOVXEvsPpUbFlg+rFkLvti1w5a+oWt4ua
	 VTOdhkhEIofbgJTBHR3w/5KlbUYHI93McjhrvN7Clk+ghSkDaihdS60Hl1D2JB2DCd
	 2mDmV3ELa8IbY2ItHYezSXqOVCfMtgVorm80+I6kbTcSJqhDOWVUniisJxQSNcxgay
	 u2Lw70hEMcb+4GnuB0xY1rI+nvjiatx8za+NqwKgRQ5bRE1cRp+6aYVy3AH1PZsMx0
	 SWQckc5gyc0rWQutfouiNfPLEpNBEGIBQ112CBpGSptFSFVd5+Tjzsqnn7j/mET98J
	 XnOEu6NEOsTpg==
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add fastrpc and GPR support for Milos
Date: Wed, 18 Mar 2026 21:46:46 -0500
Message-ID: <177388840388.11529.3908720323007931707.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
References: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 06 Mar 2026 15:01:18 +0100, Luca Weiss wrote:
> Add devicetree nodes for fastrpc (ADSP & CDSP) and GPR for the Milos
> SoC.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: milos: Add fastrpc nodes
      commit: 9e37097c95dae92209a3c6c767c12d99f9bc2c2a
[2/2] arm64: dts: qcom: milos: add ADSP GPR
      commit: 94c1a37a1dc14cc1cc5e1e4ed01a0c65f548cb89

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
