Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279776;
	b=uqdZ8W6Yz69OxHsD7Z4ADCa440+g55QRQOnG9yHec/QSBMEVxNtQcQNa+V9emfSNO7a3
	 1kRtF4p3TIFERdKNPWrl8NOMUtIj9s5iV5M/4Ww1o5S5EpX4ig006m84Tu3zHE4N6qiBo
	 L4e6dLGJivdHSHk5oibOhWYlG9RiDvSHPVF7CrJaXufWIB75MVgJi9zILZ6LmMetvUGtE
	 S4Nxsb54VOvyXqdtrW7pJ0uzz9mhe8Hd+IOUVEnik/kb8CDeZDKblZdp+USoUQvQut8sr
	 tEvnA45V6RUvwuN4N3BwU1/xD8AZS80E6QB1f0pAPGdPIJELKjglz2qdUqHSvJUhwvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Tr5CKU3UlzjWznuI2jt2cmP/efOOLT4RS9lkC9TSPu8=;
	b=BN21wVzvF8b82mPtOMJG5SfpxshP9GwWJWuRHm0LJZUhz2Et+sMVJhrGpHR5am2R9kLg
	 B0jzmAr+bQn6c3ML6vbuS0qF0Py3wGU9w5+YluqPblya62S7b79JDxiw3u7EY2V9qYzeG
	 JnVBkF4C8CHDVYqg/JieBb5maj+rf5gbudL7vEXeR4FsxUUeZiv+jN4L2gxbpk4FKPliw
	 iIU/hd2GTYL86n/peSo1USpOw/LyW0RmjuWlBxOzItIvyWLgDL1QTkg7LoJ8b5f1SpZYv
	 lIv6FkDK9BQfNotzFa7cKxP2PwAAUB0gyeYQVyXyZnhjoLAt0IEoTmO9Qg5TaNpv8hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OdcooltJ;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C1A606A331
	for <phone-devel@vger.kernel.org>; Sat, 21 Nov 2026 16:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C1A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OdcooltJ
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491971ac844so1706059f8f.2
        for <phone-devel@vger.kernel.org>; Sat, 21 Nov 2026 08:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279774; x=1795884574; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tr5CKU3UlzjWznuI2jt2cmP/efOOLT4RS9lkC9TSPu8=;
        b=OdcooltJshgvnRM7c+d/FGFvp62+GJqr7tPTVT3YQ1ew2d9S63WxhaYLBBMJo7Rish
         W0jFv7E+bumkwunAAIGW3/h1O8hR53Mce65f8w7P5dd+K4xvASRMIHo6FgHTVG4+plbI
         SLEjSMPhJ22OZpuOK+En0GZ9ZiMYu8oirKRLLUuXOTU80hnFa8601onbZ3qHt6gXDxwj
         m3QDaylwAlOAcskZ2OhBE1pLKpx8foNt4cdlL5xCoVbVYlv4mCBYod9ShLAFq9WuzZT1
         b3gR52+oXacMOpqxOKLS7gSu0HyRtvsVNlieaFvfxpA15HZqvZL8K07lYpZwGiQFj7sK
         /05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279774; x=1795884574;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tr5CKU3UlzjWznuI2jt2cmP/efOOLT4RS9lkC9TSPu8=;
        b=thGl1pKsWiW4oQYkBR8iBaYmS2Zsm6BexRCIUioiv2s/Q/PH3HSE7Q9L+vLE2t57KB
         yLf6pHowmwkawj0pqlhQa0KV2UmXFGlnwyZMj48RRGL892nbtXIz9Ftxn531fqYSMH2D
         foxY/A71UIbNNEJ4mefnUmrN4qLyG7M7f9R1IxFDOWVm580g7XobB7QMtUo5l7MkdZw1
         rYYcDVUcEX5/xDQREoOji6AjwoZSq+KRfWk6CcNgSIYzDqbwa7j2DEbpsQjE/GJtndvq
         HLHNONOnJWZVBJzhedBv7rQoLVQwH9Oc4KMSPHzSBjpbMfHFKg0SVTOy7WNdmTmmzflU
         btOw==
X-Forwarded-Encrypted: i=1; AL+hErE0nvm3sZ+KEOIo+MAnEk2OwcMJS3SIKgZZhe0C48UryMr6FBjJe604I5M20IaxhrQ3UOW0BQ4jReetcA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DeQroRg2RES9negZSlSyNc8ru1VScK/AgKvRrPmK1sU3Bxogj
	KSkEdjlSjwfvI/RCg0JljF+He0GB2rhrVR0cg904/WjFWoMhI1CDhH/V
X-Gm-Gg: AZFdTZfB8dimcJqz01W3hGbgIVBBhvqrd2AhcuRk1yBNuwHMxvBd7848+eu7Smn8gUd
	tohTKyHQd+zw/62u1zqiiRRakMCvlabjkptvB1WgxlsmFmQUUpS/Y0kqRaAFdSEc5kTCwD0Ubz3
	5FdhfhZ9lGT+LEO9kBeQvIKOFGSnTcYFZafad53FizekosFj+7yGhWvJVZGKJ0PE0U4LHhHmhkJ
	Kw7khtXsrA6J+v8y+LalG9UX6NpOjTBE+dnki3Vx5jj4IelPa+AJXbzaerAjcTXJyvltTYZz4rH
	3S7S0DXdyRpNHoZXAvG/1ofAJ4OOcTRAbD63V38XTH3j7x1VAgRQi4+ZNEG2HbiyKgZ6ZoFfyL+
	4C/xtF5RENI1avBXhLMkPokzn5iOACZeMcpIWidxlir9wTcWcb+9bWnbO9lgVHMaLOXi81BqfNF
	3Nxz2yXT8lFS+rCj9bltkP0X4B4NSeIvYNfVfLDox+l1FDvh/dSlqmAQZ9rGlYVbCm0JVYV7phm
	05e+WsN+JDnZK0Qqz+6B5Bo0YLjg8jThreHiyLrrOoTbxiRettsMES4nD9Z3IGbpNNBLVZ4MicP
	eNWop92BfqYd5NK64sAet8n6ynw0uL0=
X-Received: by 2002:a05:6000:29cc:b0:4a9:32c9:a6c with SMTP id ffacd0b85a97d-4abb43deca6mr9060540f8f.50.1795279773669;
        Sat, 21 Nov 2026 08:49:33 -0800 (PST)
Received: from unknown.local ([2a02:b027:11:696f:25b0:e663:79f5:e891])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm9761749f8f.35.2026.11.21.08.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:49:33 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH] media: dt-bindings: document the Dongwoon DW9763 VCM
Date: Sat, 21 Nov 2026 17:49:04 +0100
Message-Id: <20261121-dw9763-v1-0-f215290602f0@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyND3ZRyS3MzY90UQzPjRNNko2RjI2MloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AcDXonGoAAAA=
X-Change-ID: 20261121-dw9763-d163a5c2c323
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795279770; l=692;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=VFe6rInvOpcbpjq2cBpErG4KxA9j/Y9r1X0v6h+zhYE=;
 b=N9bApgpYBwVxB7xDyEKPDEzkL/ZOO/P/SlJmM9T9fKdCl3jhJ1rEKJxw4rPB1UjuXyAXn9Qje
 c4Lnp5DPvgEAFM+fzXoY/wgd0DT5+jfjdjrKFbulNhO56PJ21VwdRw4
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

The Xiaomi Mi A2 (jasmine, SDM660) has a DW9763 on each rear camera.
Both work with the dw9768 driver as is; the commit message has the
register comparison. The jasmine camera DT that uses this compatible
will follow in a separate series.

Discussion: https://github.com/sdm660-mainline/linux/pull/267

---
Gianluca Boiano (1):
      dt-bindings: media: i2c: dongwoon,dw9768: add DW9763

 .../devicetree/bindings/media/i2c/dongwoon,dw9768.yaml         | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
---
base-commit: aa0f4c41d4870a18e65772a1817af16427200371
change-id: 20261121-dw9763-d163a5c2c323

Best regards,
--  
Gianluca Boiano <morf3089@gmail.com>

