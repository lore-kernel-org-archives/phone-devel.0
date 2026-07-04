Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400E03A1E67
	for <phone-devel@vger.kernel.org>; Sat,  4 Jul 2026 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783155529; cv=none; b=ojdpzl/i3EMsUk2A7c+PTYuuKoqJWdHgI9JtlW+tcocLwCm6rXFVqsNg6fifLIAcTx+1C5Cfh85SAQKUZaD3J/TyXRcp9ImDEWbTdev6tu8hQxJEk9biLxOf+mjKnnmT+DgfC2bNdHJcPA372aChPo8QiaOoPCbe31ITodKbWHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783155529; c=relaxed/simple;
	bh=GO0cPmRaJ+HhoODbOUmJooxCNjwQwnK9RN6Sj23Fxbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEKNq5xGpZqqyxT975JFvYW+xZTR1jQpnasfznJpp+s51GCLGCAOs7UrUPKDTlPMO++LnG6CGKATfP6oZJ4gtQKyOua4kNOffoimxn3yD7D6WRn+b7OFcipUkWo5RyUd7mCTEnp5BRMqjEkvOtsv7LSGIryARRk63xeY4quisBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iurhp0ka; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iurhp0ka"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-80a123ef90aso20462607b3.0
        for <phone-devel@vger.kernel.org>; Sat, 04 Jul 2026 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783155527; x=1783760327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=th9Jzp5gWYXL8UheexAgAZq9F8KzRdESqUqY/zvS74c=;
        b=iurhp0ka4+sQspOkzfmtRxfaXR20joktFvOY3+SR6BFKoQabAEUVIlCKI7D5Pt4uf5
         atZD9ghwssTpRBIwI1xv5QHKZdMbMfSf2Jjn/lq72rADXBUV7G3nsEVYe8kEG2r6pyKv
         TRVS3RuI6Pl5CWouNgycCky0e2lJP+EDtgnWGbgNEcSVKFVVt5lBnmN/1s+l5/WqDWgI
         B5iv/1BSsDtLVnJUOuTahAxiETFOThbYYQn/8jsIUb8pAM72fTSeIOFVzFu5l1oZlh/T
         QfJl6+ymRokEBl1AbF6oK+SI8sfraGtThwIf2MEdEELRMVRuHNw2Rkw/R6Pb1XBK4pfX
         Bhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783155527; x=1783760327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th9Jzp5gWYXL8UheexAgAZq9F8KzRdESqUqY/zvS74c=;
        b=UoT1YXnKv9478NAAnXMRxL6A0s08ee7WBMeUEcs2sWwhUDqfAabIBp5ls5VHFKBvkQ
         jMf/P4MMjo4AwXkn8GqvWzU5+mqqIVD1BVcK2xsLzs2Vh6pCT1q5YLVAWTWGLC0sP+Pi
         aHFnWdBM2A6oLR+0bTjrtTT335QvZCmMPQI474MBVPXB8l5UOz2rcXzzG2v+BzSdQ9Yt
         p+xvFZOXR2VreFnwKZHwOyDDKtDHG1ktTLSthTYgOMEQLJ3qrA2xnUT7zz4SdC7tgRKM
         NRjNhKokOyANC3AYp1OQVnytRFus2kIJ5XcA0GUqmbhUzjE1T5FHFE+e8Sa+FNuFZBjE
         sJFg==
X-Forwarded-Encrypted: i=1; AHgh+RrwG4Lhpt87PNJgT6loRDasuQvR4A8b1t3KGdDhWf5DY18G66YrBeFPzXEC/3zuvs93lYTkrdGlH7A3EA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvAAsmiA2ftiKsWCGn8O44Cfuw6yd5UJZo4i9ronK5eyUPW4NY
	iyCIcXp/Zg65QBQWCekcbaJcajkHhpGsDuuxOHcM5WUB4BMU3drSJfY9n/NCHg==
X-Gm-Gg: AfdE7clH9TQmwyIZ1qHUV/i3LTw2JiXYfvCEmkQMBSgM+cbeJP5MN9nXc7P5IzydpaD
	BcQiw1xK5H/EOlCutC4lHh2qJ65FADWiUrfb+KJYfUSxEW9Ww2tUK6tmqBcMg790TWn7Lmpu5s+
	PcmVvJpPvvkEe/qJy6CY8ievPPpNQLL6YUJgmKbV6VTYu1qmiuwVaXHmCvxox8ifKbzg5sMtG4I
	7ACA2vqNg2i0rzY0Yx8OPBhJdXI1KYpcUChAARcFI5lAg5ZmoepQEIKh2gNk/vibKTjxk1h8PNk
	CNfZ/IJ57Vxdl45Q9JxO1uFmuGqPUX2sYiycwOpxpNS2DBCs3Rq+ir79+rv9Dq50vc3DezDXh+E
	1Q5XoggnWPA2xHPmzwlI8KYtopaJMwIagqQfA7LKx853hAYcTm/VmaE/0x4Kbc9trc12e8krDY+
	a28bhTLWcxyyBQZvA=
X-Received: by 2002:a05:690c:6088:b0:80c:9e87:8108 with SMTP id 00721157ae682-817423a4278mr24400637b3.15.1783155527356;
        Sat, 04 Jul 2026 01:58:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144b73221dsm33341637b3.39.2026.07.04.01.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 01:58:46 -0700 (PDT)
Message-ID: <2dd8c0a0-7443-4d43-972f-979b7ae4b666@gmail.com>
Date: Sat, 4 Jul 2026 11:58:40 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>> +&usb_1_dwc3 {
>> +	dr_mode = "peripheral";
>> +	maximum-speed = "high-speed";
> 
> Does super-speed not work (if you also remove the qcom,select... above)?
> 
> Konrad

I can make a file transfer over scp, but the speed is inconsistent and
slower than with high-speed. It must be because this device does not
support USB 3.0 (super-speed).
