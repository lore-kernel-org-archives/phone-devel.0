Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794705773;
	b=QiJYwYEWvPu8vXsobWcdnxfR1SNmfae8yA08vHESJHmu/qai4pcbNzvb6J9fi+wTdpd+
	 6XvMfcZd/msOLZSa25SQiIgzrIDMEBkPrGmGn2Z0rfA6k+9AvLc6w2OjoXvAPnB2XU3/l
	 qrQEYtj1UJj0Zfb3YixFRBKy9j5UFKo8On/WUGBGj4mAG334ovmiwY8NaOWOesvWIpSNr
	 15Mhj624QZZF0Yxnk7Bbg78vwQ/wlq7ew2BJfRju8PwpZxC+rXfQtBN34pRTorzGMCoDF
	 UU2TKA3YbclmHCtZOUs/tTcytCWoQRM+ZPAUTjantqMVhsW4GjaVp9/JI5vLnDYHunQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794705773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dp/67JmcNvmFQHE7Njd0ridip6Zcl0Wn6uMgmcNbwbU=;
	b=OQwypqL1SzoWnDiwlbBB4exstn4jAcVW4ArhQ3fPdxyuSbGABUr4CGTx3mQy5mFrfDj7
	 PH+PzaVZDAvyqQy0iKur4nFxazh4DViR9j2mGPZ8o3oo/EHmHpwfLR+gNp+CzZbx8IH/O
	 pCCVAPL53tPdqUR8ChBi5rCEX7ouVBALUvqOv8w+efRlnRJVSabf+sW044OD4ZuPO80Tv
	 ugJo13t/nbNTaEa9no83J2TYPoLVDvQgshX4kJ1OjuLPRvbemHOpN0HxR6U6ocXagZpDj
	 KfB5dxXEZ+B3EhQyvPu5sd/kQ3b7LqF2pqNNxGjEZO7gmg+j9DZVrJfTvzLa/wZLa0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXvE48TK;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CA6606A331
	for <phone-devel@vger.kernel.org>; Sun, 15 Nov 2026 01:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48CA6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXvE48TK
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so3899616a12.1
        for <phone-devel@vger.kernel.org>; Sat, 14 Nov 2026 17:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794705771; x=1795310571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp/67JmcNvmFQHE7Njd0ridip6Zcl0Wn6uMgmcNbwbU=;
        b=JXvE48TKiy91S9dvEv9At4IP8YWrv9G85CuWVftuPW0Nm42VDo9KFgSl0Wt6vcS56X
         H/qmdvNli+F431Mg85skwEVk3uZHmXjh03Qi1nriXU+eIVvL33jxebJhCOEYHkhdTzpe
         qqZmE/91d+DfQD6wRraqOOfh+6h/j5NhZExktRhovVugD8/uWjdRZ5edtEdRvQKSbyzS
         f2JkGxlgs18vVYYXWbHFihlv83Ce+ekiPSYHXuNjHYNdv4NqwZegVHcEX7C9VocMT2zZ
         HChWwWqXQwoRrokeuXsOueXT9eKfEoso4m9TOGVYvUa0b1HSABp4Vy3dHtUYsJRq4o7h
         Ty0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794705771; x=1795310571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dp/67JmcNvmFQHE7Njd0ridip6Zcl0Wn6uMgmcNbwbU=;
        b=u02ARYs7cB7WuuDzEhc07MT/3rcU8Kt7qpfH+wsLoycuk6/CCcM2EDLnW8JDBVV3Py
         nrXKdMAi8kLVbb2qgxaFL97NXb38cz7WwonMsALXN2H6C5xH9tgo3atsJxJDs+lTAgtk
         CNT/t+r72XqJrlaNQD7dNcgK7SfT2dI7GzwK5rtZBk+Ef3KKItwB1OGHxeFrM0OrMo5a
         /dwvE2SqQDFqP7hCzfJobNT6fWOB2hKQSmePx7xKjXSXFVh8TAkJjYHgouQcvwL33WyP
         fyfiSU9MBS2nLFP0d2ILGVSq/Y4yRo7GqaVzATf0XD5uHaguMjvV6YcKO4rQwq9HRjbx
         egNg==
X-Forwarded-Encrypted: i=1; AL+hErEuJFpVWTWwVelkG9WJaLIh/H30P7gFaVHmi7NOQYqTAJ9OWucwt9oWVyqfktCq3iHr4KqL4D3SjW2eFw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8HQaGG8ra2yBKzUDf62SJotN0I5wXVqWvIFlKQMV5N6BYII5wh
	LpYKSmbKxJeb3DdJzlgZZ40w+72eMod6ekp7qFn+S8Xf6Y2aVPFz/aA=
X-Gm-Gg: AYBFou3Bvv/DjGNaEMihp+dYK2X5BeLTls9DpLon/s4QQw+JFdaxwWUuuox+zWlGx8Y
	sKKgVrugiA8iXO+ht6VCKTp3SNjlmJPxhg85qzGuOrH0ExcPAUJBhdM7SQDT3+q66biw6gK1XvT
	w7coOcT/E75kq9MCisGmEdKZKIfeyP8sUApMAp2h+iSF9W4vtdjzjh9Itf/+8lYHa9e3qEOmSS2
	2Sealo79t4GIG/Lh40wI2Ri6IbXFmHyFO6SMLbVQFLN160cxiyg7oj88CWH9ToiEMeH8J1TTz03
	+cwoinaiPy7XTrMUC9yTNrvbzm4lioBBaKqkLYR8/mtYeYjDHJN6nefcesDKDmZkS7um+BTEb6A
	ifp4AdvK2Iy+jnBeieRDwbEE8vxpuD1q+LqeiSa9Ec8PsNaeHXhu/6hxKbRXyHmtjmS10XcSRc5
	SCEltQtzF69Xyi6wVbPF/uyqKoCt82y7RlqgHsfqxPv9nCQ/WBM/vHU7lCni5y9zWhY8aQ0clEm
	XDUk43FKun8E1PXHsyIB+CzNNIICFEv75vh7WzMqZxHGGrLdHnZ8kV67HR9BhZHY3cMn2AuIbVZ
	VUESOefA5mOXMRAb9OgjSg7/CSn8wZtDKy/hmdirFwFRwGkfwUnQ2wn3Hj5C+i7qfAe7eFJ5ulV
	ylOpi4Smvy6SHzZyUhzR7cY94
X-Received: by 2002:a05:6402:849:b0:6b7:c9d4:6b96 with SMTP id 4fb4d7f45d1cf-6b7c9d47044mr4130497a12.8.1794705771576;
        Sat, 14 Nov 2026 17:22:51 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c6a5924bsm2636697a12.18.2026.11.14.17.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:22:51 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: val@packett.cool
Cc: marc.lainez@gmail.com,
	luca.weiss@fairphone.com,
	barnabas.czeman@mainlining.org,
	danila@jiaxyga.com,
	sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Add driver for Qualcomm QGauge (qcom_qg) fuel gauge
Date: Sun, 15 Nov 2026 02:22:47 +0100
Message-ID: <20261115012247.621144-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112170841.2189322-1-val@packett.cool>
References: <20261112170841.2189322-1-val@packett.cool>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Val,

On Thu, 12 Nov 2026 14:07:26 -0300, Val Packett wrote:
> This series adds a driver for the "qgauge" battery fuel gauge
> present in Qualcomm PMICs like PMI632, PM6150, PM7250B, PM2250.
> The PMI632 is used in SDM632, SM6115/SM4250, SM6125 based phones.

I tried v1 on an SM6125 phone, a Xiaomi Mi A3 (sm6125-xiaomi-laurel-sprout,
PMI632), on top of next-20261113. Board side: the node enabled with
monitored-battery (simple-battery with the OCV table from the stock
profile), io-channels = <&pmi632_adc ADC5_BAT_THERM_100K_PU> as
"batt-therm" and power-supplies = <&pmi632_typec>.

It probes without any kernel log output and reports sane values:

  capacity            66
  voltage_now         3979548   (vbat_sns from the ADC: 3.98 V)
  voltage_avg         3979937
  current_now         -72631
  temp                297       (SoC TSENS zones: 29-30 C)
  charge_full         4048000   (design 4030000, so the SDAM read works)
  health              Good
  status              Charging

Two things I noticed:

- voltage_ocv returns -ENODATA ("No data available") while capacity is
  reported at the same time. Is that intended, e.g. the PON OCV being
  used for capacity but not exposed?

- status is derived only from power_supply_am_i_supplied(), so it says
  Charging whenever USB is connected. On my phone the charger float
  voltage is limited to 3.96 V with a local patch and the battery sits at
  3.98 V, so current_now stays at about -70 mA (discharging) while status
  reads Charging. I would expect the same once a battery is full. Would
  it make sense to report Not charging / Full based on the current?

Tested-by: Majid Hajiheidari <majidhhdri@gmail.com> # sm6125-xiaomi-laurel-sprout

Happy to test v2 as well.

Thanks,
Majid
