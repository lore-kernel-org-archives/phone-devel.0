Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692CA42CAF3
	for <phone-devel@vger.kernel.org>; Tue, 11 Aug 2026 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440686; cv=none; b=cWQQElUPpV32S9CJwKQ6+wYxaZHETefvBqSLJAbnEyuAgwOX6JCP0zUOlFOgqEvy8SPTFE0TXBFbJxImfxXUk3rxZ4ZozZ+8mqIlIHizLSHDiOoua/O0dkiXt4t8fLSkdHUEZbQjdvpwzVGBYlUoCupoM/zBq3Kch0fv1gvfJJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440686; c=relaxed/simple;
	bh=8QXwmcpvLOgS2HJEcrVuGl3PSKJiGBxtH2I13j0yeZA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=EH0z27A4DhFqSlZguzLn/22d/xFDTGZeCPbXeYGzZ1t8+7TudZATOuDxEUESUWilWvD+C4g6Cd8kEOsYjY8Vz1UtSM1IUWQc6+XM+ALaomiIoGRgpKG0bflWt20ld02lP8SH7XDHzTp/RJ8si+OA6atFxgHnhNYblsQFQH8FYds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyk18MWH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyk18MWH"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cad8076b01so6679135ad.2
        for <phone-devel@vger.kernel.org>; Tue, 11 Aug 2026 02:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440685; x=1787045485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24lOYUM9cZxkUEGLRg6JPIJ8J7Sm+k+/AF/RPaqeH9Q=;
        b=lyk18MWH3cpWuRrJa34S3ofIqp+Sfl4k2izTx9zDN4o0Tkx5V5kKXyAaUtxyKP7nf/
         KSZlWbU2ZcxU3Uy8AmbXgYuUn5aK6HLDqyKrJROXvzwzgxlaEOphmZyR6InS+5JKd1uL
         0mAyD2NfhFMEP8Jc/UdIh8LH0dcZwMIoI5vwFCjZW24bXZZ6znSVF6b8peNarhZ00Hng
         J3o21LzWuQfo0IZcF6FqG9zCSBl5Z2lCYz0Hk/IROCNaA9QdiouqkQfEwgtHLNl1OJ8m
         MjswBXSo45pACCZnkKE0DpHtOGexSZIvbZdBcHyg2PDBDUx7ao9nFLI0Vl4q/TGh7Gw4
         1aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440685; x=1787045485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24lOYUM9cZxkUEGLRg6JPIJ8J7Sm+k+/AF/RPaqeH9Q=;
        b=BugIFPGqOsx8OdcbVwRLZLZ9mg1WbeLH0ZNzTpEAdk1r4EP197/kpPkjsKNCogXMc1
         lQVFmEeNBCawo0B3MSxKNMdP6oK9USjtAq2G/2DRHJi8D4THImb+Y0TaKIT+BSe45OKg
         Bk1FTR0igzszn5CK09YRI15dG6nTrWeNa5w3fgmS6tIGowtlx5TKQK1CyT8DglvLwny2
         SFph0LVdPaLq8662+JAjNHsyceqp14xbbKGv0Yo4pMaeHUCI/DcfvuBhuhGWuoTLlNh3
         GLc/cmRKfLCfT6qj0f0FCBuFoE2rFS1mMgD7ORzCDKYjV8CkAcoXtek6I1nqdE/RffO4
         3yXA==
X-Forwarded-Encrypted: i=1; AHgh+Rr20VgLAeHjpRB/OomCq/u9eu8+sJlnSfHtSBSAVRxNHf6pMB+wy2Yj7SzLRwAahY+7+Mr5kgzgbs/QkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ8eYEwzb6p58qiDxqYRil4FKsjLSc/9GQug1ADCgHwYmU7MgL
	driDAwUTKcm1787wUsz4H/qyt+mMmy3EawZlmhFwLhVZ6w8T91Ulxs46
X-Gm-Gg: AR+sD11OKv+P2Q3OfYOPKbZH6uftFenozfJfMD/qyIuakYC7Q+skI1ZvQJJNITiZuld
	98HIEuAFeySsC/ptcEYIRefw+qibbyvp93bkPncCa81bsG8AxTiWDvLG72V6skMC5BwsOdPDqHk
	2ni18fgvua28B3iLiONTvKBNyi3PZWZOqtigF2NeZF+UoAVJY/6Ywj8H853BB7KeGKGKFSl9y29
	nDfl9GcxbLLnLSaq4L1EhnHBPj8+RQSweVCKKRcBV31eGSg5YRoHoZT8KdrvR1iGUlRFWhfXIAa
	9vFfI1PW7LfYQmGrBu+B3rb1NwguEMD1SfNyvZyuzkwLl3AFVyxB2PfFyh1SH/afNwJydUU+Cw6
	PEvlQhWLc9otRgRXto/qWpnlFtzcVCMP6XdRQL8gzvyxPZWKg5rbxH/x5YtNTV8FohRNxiwFnid
	rgClyx27nqaAFGZsDNc18P60okpuq4nikhb4w6x/GHKIdJlaNm4GwKIUHKPCNePeDjx3RgK06zk
	mLjY1meSxVHW70nfGTvZtfxvoA40nUGTF05vtdqpoM=
X-Received: by 2002:a17:903:944:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2d31792b495mr25426375ad.15.1786440684729;
        Tue, 11 Aug 2026 02:31:24 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f3f33csm4781325ad.26.2026.08.11.02.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 02:31:24 -0700 (PDT)
Message-ID: <73033a32-4efe-4ed2-9319-ffb205d28719@gmail.com>
Date: Tue, 11 Aug 2026 02:31:22 -0700
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+guptarud.gmail.com@kernel.org
Cc: andersson@kernel.org, broonie@kernel.org, conor+dt@kernel.org,
 conor.dooley@microchip.com, david@ixit.cz, devicetree@vger.kernel.org,
 guptarud@gmail.com, konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org,
 krzk+dt@kernel.org, lee@kernel.org, lgirdwood@gmail.com, linusw@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, phone-devel@vger.kernel.org,
 robh@kernel.org
References: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
Subject: Re: [PATCH v6 0/3] Samsung Expressatt: Camera Flash
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,


https://lore.kernel.org/all/20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com/#t

This series seems to have fallen in between the cracks. Should I resend 
this patch series?


Thanks,

Rudraksha

