Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436282;
	b=v/dOdZquJa4QQyr4dLXxOjLRkmQe7Mn+Gs5pvKCnYMkqicVX8oCLh1fZMwJD436f557g
	 R/z9wtnmFRdI3xGVKSWGtJqNhA9SMtF2hTWf6UskAi+rRW/ioh6nnhTiDg3KkCTiByOm3
	 fGjVqSW/dv3L7XX5FIpKJckQ55P2S1M933YgGXAtUCg+NTyHyqCZ/u2ns03BXPRHrSubq
	 pOrLv7PlK2zJjHHcULi1dvWBFeWjcAfmsmqn8g8V58shnJn5zfu293+MVPKSC1TMaQ++K
	 lMEfIyPVnVe8ydY4MhZbiKgjR8g6eoZaPM+0q5zBljCWhVCNVM6hG+YC4rdVbWrxAvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=a88ULBFAQx4LAiXbEAQvfvekeJqnITJpUHZuo0L1DZQ=;
	b=xI89QbUZzRQpU/2VhCMXZoqwOwN0Zd2FMCsn3s/LZM9QhUl7jdy5nexGAGj2Qbg97oC4
	 5LAARqXj2n8cYbIyUkh37mkPW05/VQgAhuJqT/SMzcLRlrifCQYWuNNh3fPTuhXgNreUR
	 nY/eYrh4pq7hKwXKSXmAek3najNXaCcP4SbMjPWOUtahCehqIQHsjSNvtmSN/p8sCGVax
	 X4x6Vh2CKi8oxpx2SFhnkcg8SQgAzjDPGNGKls+pN3yTDGISpqrZvcir+Orv5x7wC9O69
	 vfRVVwFyS+ML+EFAWXuCoavga5r4XmXGhi3tanG9kV7YSrk76MG9/OWwg4148i8Z+7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6YfVoas;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA10B606A31A
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 12:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA10B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6YfVoas
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so861400666b.1
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 04:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436280; x=1796041080; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a88ULBFAQx4LAiXbEAQvfvekeJqnITJpUHZuo0L1DZQ=;
        b=d6YfVoaswLbKwgD3P19bFRJ7ZURGLAM6cgUFg1Az7CArc+wqW7p9oN5XEDfz/OWZM7
         BNhsP3uqnO00vH5pTASrYPmILCkbDfnqyXbzN1aOLyXO8gKYRq0+8PPp6XSsqmClS/8y
         QKiU2lH2JXFvZ/cONB9A/We4EBus2jE8TIhb0YJYYCNbsds4KUlnma5I/AYVFUNggDM7
         VwxyJX7CVMT991m7EQNBh0qTSsWXSpLL8PQg+qDdReUbN6U2+9KdXOVGrc0vAuPLIv2T
         56SIttjVScC5XssqtGrOHAGAyglgIEmqbhLOnpJbhijs2+qCpmOi+mgWNmrU6hfO5c0h
         qjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436280; x=1796041080;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a88ULBFAQx4LAiXbEAQvfvekeJqnITJpUHZuo0L1DZQ=;
        b=eIgbF+1ThtcCEEn5i6KFsGpENIgT+t2OhOsCRNU3PPatJdvwwkD3LoDpKNpPSiKom2
         L3fR4tk21JT1Bg9J+F+VNHWpydbpQuMxwx9FBry5XjNeC5LM8FScqdGUmtZtGNsco4wK
         kXXl+nt3zVin7a1V3YyliocTTJeBu7wjTasY09gr5mZjbwwiPQG8pztXR9F8XSv8NKSj
         si4krYVc+AnUJH4xsw3q6wEcMTBlgGf9fHlK88G4/5uLx2jYFt1UpsJK46MSLIZxh1n8
         iJtIgE7BIsXJaQ/pCh4jtNatNjC0nxYUnXoLLFkVWtGGVojfeThuwciZjh0/T1C1htIw
         sX8Q==
X-Forwarded-Encrypted: i=1; AL+hErG+3EGIlMaNRJ5ON0IfXlid9SMa9x3sefpRtz6eVwBFC5QYkp+RCHa+D/VWj9a8k7Oza1Zx0+dhHd/wZg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8bx2jD3pbkIZn7/IbzKwrFh3+ZPLfvpsQlTR+XQRIU4+64chO0
	52oNjAfa3KSMZhDU7ijfYpj7q59C49OSBD2t38jODi7HXdzFjHfRfjmM
X-Gm-Gg: AZFdTZfOXJtugOLaavAS1lAoVj2l5QM+XcrOR/+f/Jtm1MAxrd5pmd2/6jpgRcI4egn
	qYxEYnIOyVgRK2sOZxOfitU8HXRp2EG5x0+trQn26F0Kv4R1WjFv/AaPKDIgnxlMlJDb09f0Gr6
	j2+EChg1NJnZRQ4JVo8QWuZc2ChQT80vDrAoq2Jp48McKshIyDfoRsNE9uCDnvTee6oY5wOnJ5U
	KC9oNRA5RDW1Lqmr9OKZf29wXbMkdNxWXFAyFumGzNOaz1vFFi808jZfQYLKHD+vH7sg2rtf+Tf
	x3CYEkF1lJugHXGIhac420HKfjSCyVFr2eXc2YIdBSf7MCfHvXhEzWg+DoFktwiK276b6uyWg0u
	DI7hxEhBUNTLs5xO5ceFFzzaFAPTBrgbbRYt0Z0Lvkue3psrHgLD71MmQqwfuEtui04p3CQmawK
	ufGSF6RyaceCHGqcjCpDlw2u6OWVzo+wHqwwZsOmmn+9WS9tMNPRttqcBwwqtZfvfJmti1+/z2H
	xwEDgi7wml8j4XtuodtKoVUicYlLh58X6gecUDxifKxq1RbgriqVmNF9WC6/CxtHRtYqVkUpyLi
	KM4KuIQss7hmd3KTAC9vnS6urKQK0PF96MHk2FePysB+0zYG3eXKLGsq
X-Received: by 2002:a17:907:6d26:b0:c51:50c9:741c with SMTP id a640c23a62f3a-c5150c98208mr692273566b.10.1795436279974;
        Mon, 23 Nov 2026 04:17:59 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm397263266b.51.2026.11.23.04.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:17:59 -0800 (PST)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 15:17:55 +0300
Message-Id: <DN2L1II131YK.3M3CEKXTOAUDX@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sean Wang"
 <sean.wang@mediatek.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Mattijs Korpershoek" <mkorpershoek@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Kees Cook" <kees@kernel.org>, "Tony Luck"
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <phone-devel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Conor Dooley"
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/7] arm64: mediatek: Add initial MT6895 and Xiaomi
 Poco X4 GT support
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
To: "Roman Vivchar" <rva333@protonmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com> <DN2KN6PFHOXG.1EWK1XUHY7IKK@gmail.com> <OZecqgdcxZrbwT7Ps6SDq9u1Q2EeF9jng68KHoWs8vTEetcTU8GAfC5LYcKzDGEZlr5Rlzh4rgzVh36JelFK1zHk3Dgh3TVGqj_a5Y3hv6Y=@protonmail.com>
In-Reply-To: <OZecqgdcxZrbwT7Ps6SDq9u1Q2EeF9jng68KHoWs8vTEetcTU8GAfC5LYcKzDGEZlr5Rlzh4rgzVh36JelFK1zHk3Dgh3TVGqj_a5Y3hv6Y=@protonmail.com>

On Mon Nov 23, 2026 at 3:04 PM MSK, Roman Vivchar wrote:
> On Monday, November 23rd, 2026 at 1:59 PM, Alexander Letuchiy <asalde.le1=
@gmail.com> wrote:
>
>> Hi Roman,
>>=20
>> On Mon Nov 23, 2026 at 2:41 PM MSK, Roman Vivchar wrote:
>> > > Bootloader dependency
>> > > ---------------------
>> > > This was tested with a modified LK bootloader that is not public.
>> >
>> > How are other xaga users supposed to boot the kernel? You might want t=
o
>> > port uniLoader instead, or if you're on an old enough security patch y=
ou
>> > can even replace stock LK with U-Boot. U-Boot chainloading is also
>> > possible.
>>=20
>> Right now I am replacing the stock LK with a modified one that knows
>> how to handle mainline DTs without expecting downstream Android nodes.
>
> LK is known to mess up GPIO and clock state. The earlier you replace LK
> the better.
>
>>=20
>> In an ideal world, I would like to replace LK directly with U-Boot as
>> you suggested, though U-Boot chainloading or uniLoader are also valid
>> options. Luckily, the security patch level isn't really a concern here =
=E2=80=94
>> xaga is already EOL and hasn't received official firmware updates for a
>> while, so LK replacement works across the final stock builds. I
>> definitely plan to look into a proper open bootloader setup for other
>> users in the future.
>
> You can take a look at mt6768. It's not upstream, but we replace U-Boot
> and TF-A with custom forks, as well as provide tooling to prepend
> meditek-specific headers for the latter.
>
> Best regards,
> Roman

Thanks for the pointers and the mt6768 reference, I'll check it out.

Best regards,
Alexander
