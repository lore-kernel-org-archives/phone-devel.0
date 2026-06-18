Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA7B4C6D;
	Thu, 18 Jun 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781793989; cv=none; b=SJ9f4gb8ak4hCcXrRIlBCy4uKXqVbf94SZjtQknVJvdpiJ92RnDE5QTLHvLIo/JGtCDGPbwjf6Xfiz1VCFukO7OFTRlcFdQ4W6ZsqZYmkrTjZfXRVj9T5RWCasJuIyZF+/3L2fmnhKyL8Q7lIdqd9AhXnOrPh+nrE8qBG7mRwrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781793989; c=relaxed/simple;
	bh=tIL3N4FCSzxSCcqqit+CwoquJObjshN2ehpATAjGl+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qHqf/3M8Y9QBv+0E2PYrZ44p7/8oj41guceosNRH9T0N6DbXJQ4ZLLogjE5s8JS3XcLoSTBNPgKvlyUyOTBvgqiK0XxRdXnU+OsR8FewpjG4NzTO+J4TeS5+uY8AHa90lZU4vHKUIfho2aolPLBl9oHOhHKSXxL6zP5kp69fS9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrZNhReK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrZNhReK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE901F00A3A;
	Thu, 18 Jun 2026 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781793987;
	bh=f+ggASj4J7LAitcBaDVBbOsJX6UFi2HRZh6EmL+3+t4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VrZNhReKpBJfzQkOdn1isgU8aY+dTJ3SZYyvJLilYsw/52dQYjylMLSNHebDObeTv
	 aMjqYZg+1H5gfobQLd33zlkJeSdpjZh1itVP5zLFKMIGOKf0qXzo6UO/UO/pa/ITqp
	 v9G2CtspU+WTYwkHqe1sSe63N+B+q9Hk42fImDOW2mkCbJwVyj59buSry0HLcPoYmq
	 QfXIsbm+PwCQwh0N1kJ3jIrwWSqAfxZmCRX6T7W1iCTlshXd2qJNbf+CREgQkkO39b
	 PQcjSWEAf4dEIBRCZw46ldkZX4kPsVq+M8VXcpUBGOlkQKZdK5qmXzP8bDHoUb2+Fh
	 IFbPfMj+f/0rg==
From: Lee Jones <lee@kernel.org>
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260613-88pm886-vbus-v2-0-021dfb02c6bb@dujemihanovic.xyz>
References: <20260613-88pm886-vbus-v2-0-021dfb02c6bb@dujemihanovic.xyz>
Subject: Re: (subset) [PATCH v2 0/3] 88PM886 Vbus regulator support
Message-Id: <178179398462.2177198.14068604464612849040.b4-ty@b4>
Date: Thu, 18 Jun 2026 15:46:24 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sat, 13 Jun 2026 16:20:52 +0200, Duje Mihanović wrote:
> This series adds support for the USB Vbus regulator found on Marvell's
> 88PM886 PMIC. The regulator enables USB role switching on boards using
> the PMIC.

Applied, thanks!

[1/3] dt-bindings: mfd: 88pm886: Allow vbus regulator
      commit: a5026999e04d92ec0cf539731ecc56c85f843b3d
[2/3] mfd: 88pm886: Initialize the battery page
      commit: a7c4cc8109c386bff04dc3567d92edc0a69d29c2

--
Lee Jones [李琼斯]

