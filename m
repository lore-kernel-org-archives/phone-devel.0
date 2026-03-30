Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF373DA5C3;
	Mon, 30 Mar 2026 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886540; cv=none; b=BiOM2vr9YmX5F8f8PZMBZbZ/7k3FUIfTyKRtVElKFMtuNz6WvqOdpBzrpLAJcgMu/3w4Oim1DqP4kZ0isw9t/IMs81AXploeLi6nphv/Jrl9CfLxBLkdTEiUxWDQEdHER2Bayxzc3qPZ/3ePMoViQt/5xl7h+saAJo34BwkHZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886540; c=relaxed/simple;
	bh=MdrC3Z2yCbkomz5gWrMMv92kLcM9zScC55e7fCEukP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qrViU8TiILrIdfwFFrmxGWqwgQKQL92C2fqgfaJnkWXe+OpXCve6ngNuijwEey9XcA3GR3NSKl9y4l/AfcWGj524u4TPyqOKWH1GNQzkBkv/cZSxpy/nLeCnh/X0hKTuZekazDL/G2u8xsvSavSfplBnDGsYKmI/TbC8gWLKtcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXUIrZzo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXUIrZzo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2870AC4CEF7;
	Mon, 30 Mar 2026 16:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886539;
	bh=MdrC3Z2yCbkomz5gWrMMv92kLcM9zScC55e7fCEukP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tXUIrZzou5MfU3n70h07JWlEVZZroi21zccLG8z9vpYh+K0dIPx5YYQZyFBEHjaD1
	 CDLOAezcENQnmpgg/e4DCxVf3MZ+QEnuecZEy1I3BpEwBdMdx6IociyVf3nZxk/Plp
	 WLx33Aey7+vEkqQTk4jScUCYXBHo3KvyUOB7w77/duycA0m/UkwzS5fTvq1px9LOVC
	 mKbnNCzGUSAZVj4nZG0rWsShxQuKNVQt6rXJ16eNUug7taOee4Q8p9Sj/VIxZgPlJq
	 1mM2PumUqRkeQzO+5DbgYSXfSBo6haoJdrrghYWXCrUfRaoUYgZORHiXsd+j1kLQs/
	 5bPCwXwTU5+YQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Erikas Bitovtas <xerikasxx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add regulators for ambient light and proximity sensor
Date: Mon, 30 Mar 2026 11:01:38 -0500
Message-ID: <177488647756.633011.5748926638297333913.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330-z00t-cm36686-regulators-v1-1-03e23b03bd70@gmail.com>
References: <20260330-z00t-cm36686-regulators-v1-1-03e23b03bd70@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Mar 2026 02:37:57 +0300, Erikas Bitovtas wrote:
> VCNL4000 includes support for regulators. Add regulators listed in the
> downstream device tree so they can be powered in during initialization.
> VLED supply is missing downstream, so it will be powered on by a dummy.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8939-asus-z00t: add regulators for ambient light and proximity sensor
      commit: f757451504c4eaa77b3f87fdbed7a11d1f80df29

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
