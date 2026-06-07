Received: from vinatta.cz (vinatta.cz [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7858C2FB97B;
	Sun,  7 Jun 2026 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780829073; cv=none; b=UX82KbZTU8BkSrF1fFApdkBK2V/SSW/nHUoKoriaNTsTH7F8AtHxJGKaXizVl75A3v1qi8cnqx086Fwn5XjoMVz4YfUeYyvwyMz6JPqN5BX/uhd2bF+1nXoiQJPQJWdWpuT9RfNQXEDhig+zB7QCKWyKfBdSASbIkiTj2oaOa9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780829073; c=relaxed/simple;
	bh=B5/DWKPlt2mGwsg0r9JFp68rKDRIr0W5B5omiBt8euo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:From:
	 References:In-Reply-To; b=GnrXprsvgTKb0rdp9xs4XPbm6v/1OXNveBPxRpcBrXe2k5kjCzTBj0G0A4PXrMCbflc6hWghtvRsMcrysSbW5V+kwD7pl7nIYeDo8eLWwceLjOegyzZ5S+tS5cCia50urDP7lc0Td6xkWMZrXEXhqYxPY0q/KelCxW84uQwV5LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=vinatta.cz; dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b=ONMNf2rJ; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinatta.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b="ONMNf2rJ"
DKIM-Signature: a=rsa-sha256; bh=OurYXy0ateDpk3YlHaspHLUPi4KRsSTZx66WBb+LSAw=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1780829048; v=1; x=1781261048;
 b=ONMNf2rJWZQ2aa55ZnOHK25DI6lgBSvmJfIFpb+6mNqVQyN3hZiDMUEtUoJSNubSofAK+t+K
 aGhBmxYeKP+UoQXQZvP4PCRUKM1RyWgbHcQIgsD5gQRxFDaLfj18sJEdMyMpUhbbTTTJEzSeFRE
 Uq4uZe0EdXRbYhkyOFLVOQEwsL6WDZTgawBtL3V8dyYZNNuoLwbcsL9kPkgBdHQEyjahgoMF2Dp
 c3DMWxMo5virMgvpPuUqwTYeo1xdD9bEOeWmP9DRxXRigoyylg++eABj7+ztl5MZ7R+XX3STUDW
 93o17YvFmy2gK1bcYRNkjYHzbzG0Lsx9cO3RxSE8sZuMg==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 47c4f622; Sun, 07 Jun 2026 12:44:08 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 07 Jun 2026 12:44:08 +0200
Message-Id: <DJ2R7MRPNO5X.2WPLSEDZFAJ3G@matfyz.cz>
Cc: <devicetree@vger.kernel.org>, <phone-devel@vger.kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <linux-kernel@vger.kernel.org>,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>, "Lee Jones"
 <lee@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH 3/3] regulator: 88pm886: Add Vbus regulator
To: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
 <20260526-88pm886-vbus-v1-3-f2bd1fd3c19e@dujemihanovic.xyz>
In-Reply-To: <20260526-88pm886-vbus-v1-3-f2bd1fd3c19e@dujemihanovic.xyz>

Duje Mihanovi=C4=87, 2026-05-26T21:14:49+02:00:
> From: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>
> Add support for the PMIC's Vbus regulator. This regulator is mandatory
> for USB OTG support on boards using the PMIC.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
>  drivers/regulator/88pm886-regulator.c | 27 +++++++++++++++++++++++++++
>  include/linux/mfd/88pm886.h           |  7 +++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/drivers/regulator/88pm886-regulator.c b/drivers/regulator/88=
pm886-regulator.c
> index a38bd4f312b7..039822e86ec8 100644
> --- a/drivers/regulator/88pm886-regulator.c
> +++ b/drivers/regulator/88pm886-regulator.c
> @@ -4,6 +4,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/driver.h>
> +#include <linux/units.h>

What is this for?

[...]

Reviewed-by: Karel Balej <balejk@matfyz.cz>
