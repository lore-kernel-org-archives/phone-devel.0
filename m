Received: from vinatta.cz (vinatta.cz [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A863F65E6;
	Tue, 28 Apr 2026 12:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378081; cv=none; b=m/OzzB7nj8iYvvc1njMVYkjVjyIdV6fU+LDTshk8UtxP234cKCH6Jc4uHUFxMl8ilvo8j6bn82vMS4jN8Kn/qPUeIVmGbLLMgJy4FB3bGYfbLkg944466q8RCGfYSqlCsrnEIsqo9loR4Dk2YTTuXoquAssJ+rVTNfgXamZNcug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378081; c=relaxed/simple;
	bh=THopMcPwAtElDRUjMyyfKmvTfcYIKXT2QBM8u2Qz/0E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:From:
	 References:In-Reply-To; b=HbO8q0CWjLyFHepX69/M8AfJiEAlhJK3pbZ+NbwwIKbL4G/+4Lf4hVP20LvnP2adb/eDcfBYS8wMwUQcNB6BLFpKooXMUdnNM/IW1EkjlEPju/zgHa7K4rwKNTI7IHFOHRfzctLdh+bh2Nplv2mGE7WycphhE9p+/RVQQqoTiRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=vinatta.cz; dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b=ccOUyYpO; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinatta.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b="ccOUyYpO"
DKIM-Signature: a=rsa-sha256; bh=QczeZu7gF0v+2N++LTfsB6F6SrmXmtHT861C4vJJ1/8=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1777377143; v=1; x=1777809143;
 b=ccOUyYpOtcqIW1eTmfw27QEgWmyxLbAp2Fpl/1wRU+oj8IBLeRODoQukciDhCH4enEMh8dhF
 WJXAIwjf7QVzkJfNPr4bXWZshUXnOUhl+JaVDtq2Y1psg3uJfrm7037XeCapDa6ww4hEH3rYBPl
 gRNK6ToKvaBSGZt7fOQ3no+JR+2hSTjwa8P39dmjfnxOdxav4PyGlkNXApb6K3+dMBltubBb3Dr
 jGzJmE7Th9w9W7EwsNqtPZZ4gEBk2CedUJA6iGPVjdjOg9q3yb1lVmXav5Ux3uuJy8o+jW8nTIc
 zIkwZ72vKQsYJRY9AMXW82FTSeecMkL9fZ7iSOISL1O3A==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 986f9e12; Tue, 28 Apr 2026 13:52:23 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 13:52:23 +0200
Message-Id: <DI4RM3GB8BI6.1HBB04RO97J8O@matfyz.cz>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "David Wronek" <david@mainlining.org>,
 <phone-devel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] arm64: dts: marvell: samsung-coreprimevelte:
 Increase touchscreen voltage
To: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz> <20260409-cprime-dt-fixes-v6-20-v1-1-8df6f88942c8@dujemihanovic.xyz>
In-Reply-To: <20260409-cprime-dt-fixes-v6-20-v1-1-8df6f88942c8@dujemihanovic.xyz>

Duje Mihanovi=C4=87, 2026-04-09T23:17:24+02:00:
> From: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>
> The old 1.9V setting was found to be insufficient in certain
> environments (in my case cold ones), causing the touchscreen to register
> ghost touches and mostly ignore actual touches. Increase the voltage to
> 2.5V to correct the issue.
>
> Fixes: ec958b5b18c8 ("arm64: dts: samsung,coreprimevelte: add touchscreen=
")
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
>  arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 2 +=
-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Karel Balej <balejk@matfyz.cz>
