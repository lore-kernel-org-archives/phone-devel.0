Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501587;
	b=VIr6Mz43hGeWGUrE/f2s9qWEKp52nXzUCzaeJJhQ+YUawXPlR1yC3bvMzkPJEIXaS6/w
	 wo4ks5OewVnk4Iw3skVwM8uem86W7wBjKAcO1TvP9hIiVO2PNa49T1/OjE350BHeBSC+7
	 Vtrj0MH8sLL4qKbFpI5WoY3L805w2ls3sdUaobXjxxhtLCK2c4FxIRkgAdAPcX2OsaE/9
	 IbYXYoW/U4Iny/bHEo5BzJPnoCSRCvl7P/Mxa3WMj8Q4V+OXoNVHRw0mOS/gojSepCU/Z
	 5oA1eiLCgEwBdDwbS3Tk64FeIMb7+J2vzicyOodSlex1XAj8yZHf+92B7RDvCKa4Rdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=;
	b=gVOd0VsEXjhNfg140mCS4Qpzbx/PUHb3lJzS0iIwHJNS9oaMkeQ++NaxstMJjGVVvMnH
	 RN+z1KBnfvXxVg88OzNI5KjmbKfDojW1CWGM6LyYvee6l8h6t3HkSwwwdW6ZUbkyw61AB
	 qnFiQTJjcWNTaVYukfRtROHmNNk8VJK10XU8tSOSv3Lucpy6JkCbubNquFVLSKVvdIGlr
	 e7iVIt6QGThGHO21LFNWlQJwb+VaDoQlXeOTgDmfOkx4Uejm5dAfCeY9bLuDzwRUAHoCh
	 RM3O3IBFprIAKztI28pQkKI5P4Xzn6tISeNWLLcUchtc4VGc8In1CxTxY8rRHAFKSLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aw2NmU5m;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9215E606A327
	for <phone-devel@vger.kernel.org>; Tue, 24 Nov 2026 06:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9215E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aw2NmU5m
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3869f03af6aso3351493eec.1
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 22:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795501587; x=1796106387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=;
        b=aw2NmU5mXIfml8zWv2yXkgGBsdqu0t1jHUU7WofPUO5XM93i9Id2hMdudHcF3xP4Bt
         gndhdLLj6iSmZdDlUp8knzGn+AjdVC04G8TCXIkouk7gAtkgCiqZjbo9rb7A+4YpLG9i
         DTFhf1W20CWS11DtXdXNq2spKqNYuLnRGnvSO8k3QBpTskFPW+4BL4gYYq/jVZut+zKY
         cabPckCi3C55CjRPgcVnzV+du220fYI7mjU3ydGU0p741gRVqGFIapvLGQURFOOfv3o2
         4906pe2WYq0QGwkqb83H1VMVThVX/wRgSWBrTpCk8CI/c7B1BGVD2WNXvBPsmK2Kc3jr
         bIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795501587; x=1796106387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=;
        b=OQGIAYCnqGMSr7U/YFDQA0Oo78HP01ZYclHnkzRRaIE3LfyrweLv5YzUxuOG9W55AZ
         UQAAi4nY1Slxo6LT1Ucl6tk7ydNkrCtPzkBAhchcAkjrDFh9EKbFvZkDSmUxGYGq9hwd
         BX2w0g+0/Ev/J2X3DhncNmXjrzpt1y/lVq1NfIWULBRaueGtw3OGMiffrCOC5rCV1e2J
         bPLXaf4bSFaR5SRDM3rNouR7eGlolW6D46s4ZuCaQ73mZd9ROimgmJw2LXzDiEyg397o
         5tY4y5BfR8Ghqljt0Klj5SB4BL4DWS8jM+o4domgOAXUepAA+8YRsx+pOeqCZFGWcwLN
         lDag==
X-Forwarded-Encrypted: i=1; AL+hErEf+Rlq0bkspOIV1a7BdWRxV5mXcsKo0HBPLyFaU7uV0QA48fqRiFjgie/10slIqjJHYOKFJX7jbpCOlg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+GFt/krPtoxzYAHt1y3OU/5cS41fqv+rYZKURKTJfSFxwjG37P
	QoGkRlf/MkNKj3IIm8AZnC7fllB16w7iWahG/wGqcO0Yfwlw+309l0CT
X-Gm-Gg: AZFdTZfKR3Kn0KmeoSMYtgLeU3ZdyTVTf4clfqPibEt/5RPuJT/swrJhz1vVqLICpA+
	2/EfOlXvCLseqTywemhCmTmEFDWSp0S0ZkkQf25ylaMxiy3q5QNxw0iys2/l8GrRIMOLyNRMRuh
	QfBratl2UaYBv3bWo0dQS6dmSabwWUy5qfnhZ26WyZmanyBZGJcxFttYUAky6zX9e2j4JEBzJdS
	J+P2Le5gRR+hp/03+S56neWsh0udhlhsGCOhMtuBC00MF2f2DTlvqg5e8DZQSnX+UQ6Ex1HxtTV
	/bnkMZdR0ZnHe6aZypefKYeadOsI9LchSDSapRZzPkb/35L7OnhQC+7MUxl2BrK/R438iHgog/g
	/cSTXZrnWlwRMpCQ++Nre0jAKNpsJRJ90RadV2NBMdv+URy6iLFlJDSoWYFXQWrepWKDTf42JpZ
	MYzKAvPjyNNi/E2otHpIkWxZOdSJHFfWsdcKJjJmaZg7F6WjXWB7ZUiJiUwzlzwP3zT4ojgZzSp
	a8mWINtBKUwY9oMyhU0+nJ/IwKR98G00zNt+xuj3MABYaSdjdVeDkSWr7/vTASvcaT/vpQqYNPQ
	KSZS99zA4P0U00fLXmfSPozPLgfAWrenP2jNPHDGXG6YAMlty78/81l8i52jDbX4t8W5VE9N
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr6427409eec.27.1795501586545;
        Mon, 23 Nov 2026 22:26:26 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm72739389eec.3.2026.11.23.22.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:26:25 -0800 (PST)
Date: Mon, 23 Nov 2026 22:26:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mattijs Korpershoek <mkorpershoek@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
Message-ID: <awUuAzGu3ZoADKyB@google.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>

On Mon, Nov 23, 2026 at 02:18:37PM +0300, Alexander Letuchiy wrote:
> Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
> 8000/8100) SoC. Its registers are the same as on MT6779, so it works
> with the existing driver through the mediatek,mt6779-keypad fallback.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Applied, thank you.

-- 
Dmitry
