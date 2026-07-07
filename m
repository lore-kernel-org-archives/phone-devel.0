Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1416231F9A0;
	Tue,  7 Jul 2026 01:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387665; cv=none; b=heMnLiWBGxN/EnvRYd4v1KBkbW4RRJZoOGjaAi+CTWNfkETYr+zWwWrgNYFWHcQRpnKOl5O7QE/ylbbJbzhJJC+vweJF18HcArPTvzbbp6g5znHhwIIL0oEBaEFGC4PK/1VXT5WRuW5pjJxCuMMJ+rEmxLxQNMYBRY9gVJr9uvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387665; c=relaxed/simple;
	bh=lvw3I4TWI1jWK69gk1yx0G/XBv5emzOqwkSWWH99/OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPjNolisl3coj1jjxvwuVoQ9MTzOyF/O4CwKtjsaQZ5HuHdC6id2M//ExeOas2HL1k4sdMvVHuOcG6JTBU9vVayqyrctzZ60m4xaxhbS8rkLfxREcbg1RzTofe9/Y63kA5jW5eBbKv5OCXf+AbMhajhrvZwisHF1O75IZjY7hkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbFg8IqO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbFg8IqO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337301F00AC4;
	Tue,  7 Jul 2026 01:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387662;
	bh=g7F4jQ/jT+kjL2k9TN1bHVmEhgRhrOnB0T0rRK3UpCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EbFg8IqOwSkERWAYcsoID8CwdcZ+1LWAFAkm5o8sEyWeZfghgsLMdu9DAdwPUcHHx
	 kWUGsd2meZYe5CCf94Tz9cycWMWizHj7K9Rb07B1GNSOE8zQDWKrSDSzxaqTBwb5Bf
	 pdpSM5pyiKRW2YusbNo0YHF3BIxAOQNrBjM9lH0v9OB0K2qKQFeH+kTOj/msRhym6W
	 LGMk05kzKsXV+DkCWALTzRrT1fmNH3BVM9rDcoWyKi5fegG6WINC9iXgyxyLw7ua3T
	 C1rypRf8dqvu0qOkwLCO5GoRzML3DegSda4UFgc6mnrWLswSafsinZ+lONqkAKKkqO
	 KQTS8IqXf/R1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Some improvements for SM6350 & Fairphone 4
Date: Mon,  6 Jul 2026 20:27:24 -0500
Message-ID: <178338764567.1558388.14038060755092062792.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 05 May 2026 17:08:32 +0200, Luca Weiss wrote:
> Add a few missing interconnect paths, the pil-reloc region in IMEM and
> correct the node name of the simple-framebuffer node.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sm6350: Add interconnects for GPU, MPSS & CDSP
      commit: cc62a79bfa39e057c73828c1ed369b63d832edca
[2/3] arm64: dts: qcom: sm6350: Add PIL info region
      commit: edda2a710b87fd49bd991895f34195b6ea37e286
[3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Fix address in fb node name
      commit: f6e65005fe55c3d09287851523de06367cbf0bc2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
