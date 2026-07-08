Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A421438000;
	Wed,  8 Jul 2026 14:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522679; cv=none; b=Ca6R1zK30/53fzNltbH0WL1O4nEk5y052/oKw9tMRE42pO0Nrb7kZCJUXfYH/pMWGI35v7lbq4T6W/oM7R6mEsKlIDXfaZY4Osd8kZPiA9NJVf+gWOqPe6grYAs6AmYNVIuT4RQtLcOqMngnHzhKR9HC5bJSGgAm87hts1Y7Otk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522679; c=relaxed/simple;
	bh=rtpCwt651kcQr9WKD719LDb8+o6wQtols+xtFmtYc4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZEbJeQOULJY/ESUaYi6uEnY9sWMx7iTO7KGVGI3WNpSI30s+37b95pYyzGPI+eYoRfNy2gRo1i9+dbtdJKLv7CDSop0oIl247BJzltYrhwkIFxmJ5uAlSD4bBfuvGMlHqyqh80j1Ok2izqJ5VDZJLlhAZaz4L0FrKFs/f9QG8gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZkdDD/+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZkdDD/+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1031F00A3F;
	Wed,  8 Jul 2026 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522678;
	bh=i2sp2hHDzooGbQrCnzv6DW/wnJGQmVp2vhPv3cl3fdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cZkdDD/+g8pitwc+7E7z8eMWFjaOOOIKccm8FaBCHVDugwUAV4onCWRbrLAh8vtUM
	 4DP6Zr0h+VaKTLduRgs174nhM6/aHNXmH3yIPsfWC/KN/DYDdV1NIvJFY85sJ0O6md
	 0+IA99+rY5BzBFCqN//Ty3KKQHxLGahJXZv5FN3Urd4UmNK/fS90PcvZmzWHaiYDpd
	 NAiDi7VyqmNYbRDN26kQrTHNY/+SzpVZkoLNKuryMu6+jJ/li4sbKqtGrSFzIf+HpU
	 725mzuCgf7zjilJTFVjKjlxLhAn3dOzfPs8iIhjThJgQwVMaxqmKw10AYJEnESzN5q
	 csiDesfGmdBCQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yedaya Katsman <yedaya.ka@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup panel compatible
Date: Wed,  8 Jul 2026 09:56:59 -0500
Message-ID: <178352261606.2235436.10213047628216526295.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608-b4-compatible-s6e8fc0-fixup-v2-1-d23f373603a3@gmail.com>
References: <20260608-b4-compatible-s6e8fc0-fixup-v2-1-d23f373603a3@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Jun 2026 23:10:23 +0300, Yedaya Katsman wrote:
> The change to the panel compatible was missed, fix it. This compatible is
> already in the driver.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup panel compatible
      commit: f135fd1bc76d052f1bf4b1cc987cd47fe0a71d8a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
