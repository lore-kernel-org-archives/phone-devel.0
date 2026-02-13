Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4776D360750
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770993649; cv=none; b=c6b5eaxP9itLDnLOJgKL86PewKLZ/50/Q6WHvDTKQ8JP/Dj67iRQse3obbJ6VyJ06Ev+9Te0EfsOympc0Bat8Cp4i6y3AgJyz6RntxqmHko6/hjxAwXNGQzn3jfCG7V81jTTuoCjnZNgCJ2hYqBbzYxRd1SPtnYFi81PmCkumIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770993649; c=relaxed/simple;
	bh=/GcPy/wHjt3CURV19eyqQGTVamLsBIbhBGEW0CJ6xeQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=f+g7ud9vITKFuJVyamKYvNwJ9/DXhxJOyjp8zj7LiCra9Mb1jfVW/jUa3yT1DlMJ8fxySQxplvZXHmELl6uAkdSFSY5VecYjAsSsOQ62rIMdnl8jpkPaMSTjZULCfsUBchKEGPjba9kaE+LpPVDz5Xm4mkoD7aGC1uI5H+UPcJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BQSSLWen; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BQSSLWen"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b884d5c787bso135589066b.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 06:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770993646; x=1771598446; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1LNfmW4Gw6DbKMsootSDXE2OhAklLNXTq/pabBH5ak=;
        b=BQSSLWen5kM5u9zlMAAEv4WHQfkYKkebZGlbj4OH09AmJy7RDOVACnPlemVBneT9Rj
         fYENv2TUJWysfCS9vagW+kofQ+so6cEylBxmnOAVQgbbncTQcKUvGwJXdr5xa+fFtpiX
         Q0yfB6QhEOc0fHnOcsH64xh5xRMT6dcDphdsPj1xVTuaqBIgmSjhG0w4Ko5lZWMpgX8H
         LTnkm+5h37j6VfIQRV6NrqitC1Ri4dIj5K+eX5OfRF4YatMT5i/aIJp0XAJMAOXMw75s
         2XYt5KMXKDE9JNj0H8ofOQsHP772ZbNz3SwP/Vvw38jgcO/CEUAnBUADsVAza3zFaLBA
         q5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770993646; x=1771598446;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1LNfmW4Gw6DbKMsootSDXE2OhAklLNXTq/pabBH5ak=;
        b=CXPw82wiNY4fB0j+JgzVdgm3se/ST1XdoQv+53AFhyCXZ4drVyaLZdNhJbAEk0IVvp
         HlMkQOMrXJ7RfVhh4rtcegkYsd8Pbg2p/kPGZvCStzON+wkT5qe1EJiSTvJDdXI9UR7f
         xtWgyVT1sfx+ZA1jLndxaljTh4L9jT5nl4f8PisIkhdgJC/zqppObB3Lx8oQcjZ3dQL9
         DBrh9HcRp8dZPzGqhzZKGoQyDhx8iGIxNv9/vjRQNjYSmwucWb8lZDBiq9u0HgsmjKje
         TLW9HvtkN1aG732KToNQijj789lg+S7R/mfJK+M81xEt1WfnzuYioR/Am399G+3PAqRp
         T4uw==
X-Forwarded-Encrypted: i=1; AJvYcCXb8ktDdyH0ZljsSqDvAOFqXpiV2ZTtyCFbkpiZNQd80QIF+cFq1LhbrjZPSWgbESwBd4N542bXwr6Jig==@vger.kernel.org
X-Gm-Message-State: AOJu0YykzCSzX9ylq06OqYLcqBVz7p6xbZ/Ar4+kqVbCXlzVn+BGumi7
	wHxkDjbGkEJZ1hDViPK/7TaLTOlIYOAVF4BVwC2c5ucZ6J+JF4C+Eq3vTVdv/vb8t4g=
X-Gm-Gg: AZuq6aLkegQsgFc3io1AbFSSabyWQPD1K1xy+Ut2dka1LZ8dtqPv/j1lKUD5TV767F+
	iyj2m45XtbAFfrg+jCzfITOl7Ayetvot69OaVlPZuwThfh1lmFnG2FkqJEK+qUFwC/dsqG0XB0i
	Yc8kx9BHVJLkePheZMzAsipLAZinlwp5XeqOpQs/H5Dl0zwSNKW1wxAeWbCvk5lRGS860T4gDdK
	KCmBfYm5t/mFQZWaF6fG9mXRYUUjuciAF65GhL702XK7KrS6+m/AyIqCxuupsA+2c/qcdkd7+3Q
	1wIHcG+WjqEWza6kqpKbpzw3bNgbgquE5lKXxVluKDeCfQl0+u14nErDMTkXL6gcbgFcwC8eZup
	rrU1uZ0+fLa5KzNBx3MUf+9wUXzyrWuCS4V756lptMds0AvxZcRh7+Bz6rKpgcRwdE2Btl2MJ+j
	Ls6+j0UfyFYfhr8I0Lm3cBlX79GvQcwAeN2fmxwqVwY9CpzFYmr5O3Qc6D2LZWyrGERJ6G
X-Received: by 2002:a17:907:6d13:b0:b88:6327:d0eb with SMTP id a640c23a62f3a-b8fb4779425mr110391766b.65.1770993645651;
        Fri, 13 Feb 2026 06:40:45 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f708e25dasm254442666b.4.2026.02.13.06.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 06:40:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 15:40:44 +0100
Message-Id: <DGDWUOV1HSXP.3DU4CCDF81T59@fairphone.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: milos-fairphone-fp6: Add Hall
 Effect sensor
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260213-fp6-hall-sensor-v2-1-ecd113d4919c@fairphone.com>
 <qb3zeuhh5fjteyjy46e3dbsx7ktqvnuh3snqmcvquajdal6igm@fqwv7436yw3m>
In-Reply-To: <qb3zeuhh5fjteyjy46e3dbsx7ktqvnuh3snqmcvquajdal6igm@fqwv7436yw3m>

On Fri Feb 13, 2026 at 3:33 PM CET, Dmitry Baryshkov wrote:
> On Fri, Feb 13, 2026 at 03:21:06PM +0100, Luca Weiss wrote:
>> Add a node for the Hall Effect sensor, used to detect whether the Flip
>> Cover is closed or not.
>>=20
>> The sensor is powered through vreg_l10b, so let's put a
>> regulator-always-on on that to make sure the sensor gets power.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> As pointed out in v1, this would preferably go via some vdd-supply to
>> gpio-keys, but this support does not exist yet.
>
> This usually means that it can be implemented by the submitter, sorry...

Honestly right now my motivation to (re-)submit Milos patches is
dropping. Every patch series I send (cci, ufs, wifi, bluetooth, hall
effect) is opening a new hole for yak shaving and the ones that don't
are taking forever to land, leading to me not wanting to send more due
to merge conflicts between the patches.

For trivial things like this, shall I hide/ignore that there's a VDD for
the hall sensor? In practice the vdd will be on 99% of the time anyways
due to it being used for other purposes.

I do get the desire to have proper hardware description, but requiring
submitters to yak shave their way through various subsystems of the
kernel is a bit much.

I've just recently yak-shaved my way through a limitation of the gdsc
driver[0] leading to some issues I could've ignored (because CCI worked
when the display was on), but even that thread is currently stuck on
someone explaining some intricacies of how Qualcomm SoCs work
internally. Even though I have access to quite some Qualcomm docs about
this SoC, I'm fairly sure there's zero docs explaining any of that what
was asked there because it's $secret_sauce.

[0] https://lore.kernel.org/linux-arm-msm/20260116-milos-camcc-icc-v1-0-400=
b7fcd156a@fairphone.com/

Regards
Luca

>
>> ---
>> Changes in v2:
>> - Add pinctrl for gpio70
>> - Link to v1: https://lore.kernel.org/r/20260116-fp6-hall-sensor-v1-1-69=
275c6bd809@fairphone.com
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 21 +++++++++++++++++=
+++-
>>  1 file changed, 20 insertions(+), 1 deletion(-)
>>=20

