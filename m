Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F729331200
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764952226; cv=none; b=GHZuNzU8oefWOzaovad4SafPebW5OHb+CThjFJB59e0hcXGHmAvOEmlnc1v1qK0nF9gcNRlWxhqkP5b2etTgMzuv1rLaL9qZZMCp7C/yR09PpBBpGT02fJhH7UGvRxN1mVcTw9hR6QX//UOAURDOFVfNARjPtqr5v7sr83x3nI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764952226; c=relaxed/simple;
	bh=AyEqQ22oQW2AxaUzXlKSXJWBg5IK4qyI3qo453YylAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CbOwaPoFX8ZiMPlu9cGdiRMDpyLhbBTMPRXO7kLT2yMIV98JzgBVgcU+Gs7pEXBbi5kOzbFkM+b8jiTiCPb+MtIBUcOfDX9fBck5T4t/nteYYsRQWesRyEZObTLrRiI+/dDOkUZO6Odbv1u3rkMh1rKraE5NQVCh8ipKmKesNzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STVK9w5c; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STVK9w5c"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so344583966b.2
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 08:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764952220; x=1765557020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyEqQ22oQW2AxaUzXlKSXJWBg5IK4qyI3qo453YylAc=;
        b=STVK9w5cLpyk0wvAtDA6mFq57i+C7ObStvMny7iv4jPHL6Kge9U+ymwMm4P1+faNVs
         Dey8a+G0a5miSlnbZeQHKYB6fZrKSRENd0iPKbxpeNvJiUjpAbCF1+zDSqwyDtDjH/bX
         aLajfs/FKihef98u1E3msIO9iz3Uxj1YWvVDQwOBFqAuPZUPDBdS5nImmaoeN8Y4brpr
         UhWDggb/wOHM0tmIwaJgMaaV7G00EUK23VveW43LIUL0G0U/yI3UP/JPcjRZqGeh0cu0
         xpoAhAy5LV63rzdCyEUb4k/HTg/f19o82gtxvf0wg1pasJZWV3G33o3P3Ol0wLJUZgxw
         zKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764952220; x=1765557020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AyEqQ22oQW2AxaUzXlKSXJWBg5IK4qyI3qo453YylAc=;
        b=ghm8A0rILBxSU6L5AoHfOALrI8xkooIxj4HCgYCNdx7wPcNwzUxs3S/AcZHY1pPW9y
         +bSvu4uJyW0z7Glrl0OKUQ0Q+szrwJpF3nIIpQ49FTSCbUo9Ecg+DERvJxJrYVWs4VYJ
         fiFK5VpuyBhCCoE49Sh9n9T+AFpZNTu3Cibm9JX5Vzhca3ZU1O2hki71VXA/C06st35h
         Anu4lJvXcYHkQkr2I6fssPe0E7LESEBEg4/bOtQzkKYrrFMsW+f1CNTBs2u9BYC7GlGE
         MCJdF4Sig1y3+7G1HkNHeWlgjeWqAfdCTCr1248lTWt6DFYyo/r33spUZ+KBXuG4knxC
         mtFA==
X-Forwarded-Encrypted: i=1; AJvYcCXGCCeLlKIwagGIiOr3ouKMkOjrM2+dfb2Q3MtqqFFhvLaL7Cuuu6ggxO9V2ASY6vwT72qIPZkXcXakzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypItz8ljWJ/96TbJRddreeVr1z3vpt4DHM86fu4lCxjB3fwo+U
	3H++bU5JvtT5kbaFKBw16ZvlquixUQAp3n1H/EI2/aLMDBXrJn6zX6CW
X-Gm-Gg: ASbGnctSOEAJaknD/9reEVCN65ynZ3KQK6pT3W/3IzLrHynOt/I1rZZwYnRbZfWO+ld
	whSZh0KRxsRN1Z61qrz4Mvm82EU3V/ji8QtXKJkHsAnQBy5XlusRGmffInQOmplQGP7JpxXCWBW
	LSj6r+sZ7g3kPwn77D6ZWgekV7SPPkWtf63wvaJVtM94S1v9YSSz61aa6HS60w5UUbwdws9CwKv
	Ph+x6/ZJZBSz0xLr6nsE1JfFX4VDN1jj+boarQTkGUlUYWXXnrvSGNHNA0179Fy5G324DyXVddz
	VeVPlFSUrOG1grWrr0xK18uU0nKaZV1gn7W1qY/+TSeESvy/BgkG8HSUMBbMDFpXnfNufTLfSZ9
	YN0uVzR5Ucnnw89zWuIj0Ghn0FcVWeIjr2951tG/n3I7l1I3SvGwStPYPLc5/YmMUjZuLbeMvU2
	3qVaE/9xwgwxtyI1XCpPs=
X-Google-Smtp-Source: AGHT+IEeDHPpfUgYJWf2ll0+1AfsrzSpWoZY5OWeKfS4OoSjSHurxojt3+dBMiMCGkDmWisqS+lV+g==
X-Received: by 2002:a17:907:9625:b0:b76:d882:5aaa with SMTP id a640c23a62f3a-b79ec3f0908mr670737566b.3.1764952219257;
        Fri, 05 Dec 2025 08:30:19 -0800 (PST)
Received: from crusty-box ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f449c375sm419408266b.24.2025.12.05.08.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 08:30:18 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	xerikasxx@gmail.com,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: msm8939-asus-z00t: add battery
Date: Fri,  5 Dec 2025 18:30:14 +0200
Message-ID: <20251205163014.51395-1-xerikasxx@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <509d5d7d-b7a3-4dc9-b3e6-c3e52abe040c@oss.qualcomm.com>
References: <509d5d7d-b7a3-4dc9-b3e6-c3e52abe040c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I assumed only data for 25C is necessary.
I'll add the rest of the tables.

Erikas
