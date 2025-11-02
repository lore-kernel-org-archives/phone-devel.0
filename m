Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED222333D;
	Sun,  2 Nov 2025 18:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762106792; cv=none; b=HupqqFhMy0SWB8Q0TYyhwRAc8HH54TmqBf65evaNEikm7PYoTiHG+v5uPos/HY0aLf4YS6lQ4O8CvVEE5TWpv1ALHArxpK+GD/kcdjR1UXIWI/Wesklxo1x4Gg4jj6RRqg4Jfh2oFSTNcC62djW6BilzqXboRsYtaFWBZY7Al4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762106792; c=relaxed/simple;
	bh=/OcBJe0JIgvSwo4gyBXMM3eSvSyA15Hz/r1ZTxIsVI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RsUIFFJO/5PJmZ92LtqcU6dNKpKaJ9JPA54HBMK6Ex/RhzLg+ALQb/4yOR1p9nd0k1L6AOEYa4H2uq3HDFRalH2sriRWnkSnDsSP7qFaDXUlPxNCNwnY9ML35cG45zFwV+t00gPWdNbir8Mr0uy5dD6ltKzJ7goUdubANJ3sfGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqoEzdl7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqoEzdl7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44301C19422;
	Sun,  2 Nov 2025 18:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762106792;
	bh=/OcBJe0JIgvSwo4gyBXMM3eSvSyA15Hz/r1ZTxIsVI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eqoEzdl78Lr/P4P3HMHH5uoPdyecpZ/Y3i/cG84FESOuPYh+JvcAxctIWtrrZdLg+
	 mtbtlMt5iREhbk7utHBGQvdFVhGWPR8yNozQlc73z8GcpavGfF/gnxIF/mq4iMPZPR
	 YBHYegVKtg8wnNGkm2bM87x8+5PN1ZLRyKoYcxdKQyCTwnjb9I+ZSsQ298j+JCYZYk
	 ml1gRcaXOrHzjvJKLv2yCDhAfnlL4A64meqJEnMkKE2ag+5j2voISMDaHFlXpDvNwT
	 72qVUEf+UMOcgIdc4OFR3lJuoTv5ygcmWiB3h7/tCJAcq8w4dxnYE34rdEV65C05th
	 QVE37O03rLing==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <raymondhackley@protonmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] ARM: dts: qcom: qcom-msm8226-samsung-ms013g: add simple-framebuffer
Date: Sun,  2 Nov 2025 12:09:49 -0600
Message-ID: <176210698640.937813.5670652577032025530.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011185750.743615-1-raymondhackley@protonmail.com>
References: <20251011185750.743615-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Oct 2025 18:58:00 +0000, Raymond Hackley wrote:
> Add simple-framebuffer, necessary power-domains and clocks for ms013g.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: qcom-msm8226-samsung-ms013g: add simple-framebuffer
      commit: 84df51667a196a0eadb22294eed1c6440241d74a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
