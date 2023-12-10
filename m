Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8681DDE0;
	Sun, 10 Dec 2023 23:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBbRV8SI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38BC2C433D9;
	Sun, 10 Dec 2023 23:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702250479;
	bh=oezeBfZo/+ckCa0S1GKmQyyh1vQrPZkPD1HeZu+TTPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tBbRV8SI1oBJIwgABz3q/FoKvwfhfUEFgqgtrmTtuH5YO++x13jpxNV6LpxzEix4U
	 3gPwCfDQaP7hwW/SoOrCZYaK6DTIQxUhp2Zt+B9UwxR8KN/vilTDdrzFoBdtWBdTsn
	 JWhVb6h0A8VtYBfSuvFhoTHy1aS/QfNjR9T4vHrqpLqO1DD+eTjEyHzFJthvPtSu2c
	 MCwA78v+mjIl8i2iJhWRsydqcYkoADDW0nafLm9rU1Lm8fs2MoB9REVRhWLgbSZ1Lu
	 TdPXsBIz8zn6ctio80//NKhPgAcFgyFZj9ZCbHRMaMR0mZvMPffX34tiUNYKelmIdu
	 yuZy4j/mQKYtA==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryant Mairs <bryant@mai.rs>
Subject: Re: [PATCH] ARM: dts: qcom: Disable pm8941 & pm8226 smbb charger by default
Date: Sun, 10 Dec 2023 15:25:40 -0800
Message-ID: <170225073875.1947106.17270085860203406913.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231203-smbb-pm8941-pm8226-v1-1-9ad75909604b@z3ntu.xyz>
References: <20231203-smbb-pm8941-pm8226-v1-1-9ad75909604b@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 03 Dec 2023 15:19:18 +0100, Luca Weiss wrote:
> Some platforms don't use the built-in charging hardware (e.g. milletwifi).
> As this is an optional peripheral, default it to off.
> 
> Keep it enabled for all other boards that use smbb.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: Disable pm8941 & pm8226 smbb charger by default
      commit: c9c8179d0ccdf024ce467b4c9cf5de8821bc02cb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
