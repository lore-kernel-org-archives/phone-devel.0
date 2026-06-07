Received: from vinatta.cz (vinatta.cz [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B9F3164A1;
	Sun,  7 Jun 2026 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830213; cv=none; b=OmeVmJOkeSwwtA74eWuXUklXrYsscGNzXhRtks97lMN87/9ke7HNICo7z6bFdUBPn79rxngL/ovbN3jGeKuczoU6f3YQo1nxuMg1NqLFlMrGuB8Cd3u2usXGYGB5J+UrB+FL36HYZmWq5hVwdjmPCjWeMh1ggHkMqzF6Z5cc9no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830213; c=relaxed/simple;
	bh=ev3oQAl3uBwj/TUUxZSdrlpEYfObdBshwPKxqaqax6M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:From:
	 References:In-Reply-To; b=VrxVv8JAW5irDVkljATzIwwEcyrJg8IBCuJl3tcvk8gGmwB8YLT7RbxGdMlt0cUCOrfC6yENt7V0BJo2m4KsiUm3+T9t6dxG5MaC6Kq+bwew0a47Wv01lYOYKArEVUBGhUeR78hVXGW4/Lg7oPNEp1JvaoO9sogEOxKoceQlhZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=vinatta.cz; dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b=Cw4ZIG8l; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinatta.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b="Cw4ZIG8l"
DKIM-Signature: a=rsa-sha256; bh=ev3oQAl3uBwj/TUUxZSdrlpEYfObdBshwPKxqaqax6M=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1780830188; v=1; x=1781262188;
 b=Cw4ZIG8lf3A3lgHmVIrz5nCRxv/SWOcHn/QzbCb+1J/2Zdpk2kG/RGnh6RgdKXiJJMVxS0Cg
 jxGvNw6wP6F7LPgN3P+0nAMVlZ3F9EEzHIm47VcCbmI/1ALL+cCiq4meXm0R3ubnLMg1bZTtFBG
 +sNK/38ykLe2NyA4PpNQl9ONZFRIm4zBsEF0zELWle4DCUlvFlr8cTv6ZIhm5Cycv0lAAHNeyJQ
 rK7OzQZlDEGGL/2GbaOpaHjJ64pDash1HnlThdjbXFS/+PFZ0AYd9OIlwmYYzjr6unDS1asQmeD
 uUBLh2t9RZnzfRUqdbv8MrI0NWJFdwLBpMy3VT+ClMy7g==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 ae42f724; Sun, 07 Jun 2026 13:03:08 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 07 Jun 2026 13:03:08 +0200
Message-Id: <DJ2RM6JMQ0OC.3JSC20A2FDNBX@matfyz.cz>
Cc: <devicetree@vger.kernel.org>, <phone-devel@vger.kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <linux-kernel@vger.kernel.org>,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>, "Lee Jones"
 <lee@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: 88pm886: Allow vbus regulator
To: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
 <20260526-88pm886-vbus-v1-1-f2bd1fd3c19e@dujemihanovic.xyz>
In-Reply-To: <20260526-88pm886-vbus-v1-1-f2bd1fd3c19e@dujemihanovic.xyz>

Reviewed-by: Karel Balej <balejk@matfyz.cz>
