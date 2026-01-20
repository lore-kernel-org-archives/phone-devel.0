Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B4C33C538
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904435; cv=none; b=HERUaJRAzEybVkoMnBcJ+KYlt2o3l3ZJIwTzh8tnB2XYdnESxv5jlsGWW2p+lmByCPXR7beJ6kE2XZaTBC7j9y41BsoCptFuDGnHAb/zLwSewwaDeh/LcYZqzwqudwkzHlo8y/fsJXa3i+s8JNh4DraW+9ZQ8AMB0+4lx0+4qNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904435; c=relaxed/simple;
	bh=bSJbES5pqF7XxE3mRvHoHXslbCwJasW+SdiW4w8iBzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBuUPe2GtOKQ/TYGHwdlOPmazOqqG8pY7KWBC2JOltvyLH3MsAmS1bGoGz9So57Q0ai29vLUSDFwoLZ6sLt+YIHUpgUzNTLg7iVyVHhipVTfByh58ANfDWxQRNWDABf9WfoS873+5sXGt/UwZaleM/TCl2gqKvFgOSgiUKBPbP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SumFlsmg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qa94ikhd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SumFlsmg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qa94ikhd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K9UuoQ3177315
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 10:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSxIxX2ynBDeEf3sPU3u8qhtOsS03ktsjbhTV15qdlQ=; b=SumFlsmgv4xv7yjk
	PaVa6Sk23yGzj4Fvt1+2Us7Trg91jLTJsXQSh6HEGriHBf0w7ITLbkaNC87Pa9Il
	vWIuExwr0d3gwUn35xi+/u43CoAr1FOlxmwy9BPVa7EZKwUTerra24ddLrvXpaLN
	2GazU6c0Qe1Pram5ag/9pzeK9Dqa5Cj3b/SSWcIdCreL44Dt2Ig2qv3W3YiC93YP
	HJdZqV8OVbueXJcOlOvFnDeAW3gJgLdKz7JgJYVGvZ2no7Mg1XiEcVbiojipWotj
	UJezjyG/gEHsdKSjn05D0pf76Fp6y4bSnX8EiXtOjq2nK10s00ErAKma64LOzXxs
	igzHKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt0p2hc1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 10:20:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52de12a65so134582585a.2
        for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 02:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768904431; x=1769509231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSxIxX2ynBDeEf3sPU3u8qhtOsS03ktsjbhTV15qdlQ=;
        b=Qa94ikhdHaaYykjYMajffydu8JxJAT9wmn7Pla8Sa/l5I1AAChMU7n56W+a1Sf64G0
         TtKl76h2BXkXCJN8a9LP5nyNBzgCc0tb/D/pYwycQpyMyO91NMPdjYk9MP2OPkOpTfDv
         aQ1gSR1NI1S8+kQrrGveCV2eZMY9CLzzUA0q45M0WmJFNJHSF3gToujeldujb3t155+e
         Uy4i8gSmSlAINPxgfwEXdOutmyoM71Ve1UgE0sn7CAUP022S8L6K8uBr6osjKDtsJn3i
         v1FQVjoJjyqzaCmdLVkquNWOzcks711EXjBcRELBxOc9gCw+rh8ZBkVPvebm1NzC4zPF
         DRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904431; x=1769509231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSxIxX2ynBDeEf3sPU3u8qhtOsS03ktsjbhTV15qdlQ=;
        b=jSyWhpftg9CO/iQ8JhjMZOgy4ChSDzJn7TsLVgq0xG/GpJL50mRdppv3qJPqvH7hSL
         klTRac6jN237jdQaH4h7JsjvvWtX7kQros0eOcjr8yU8JujqMM9vLW1YnWn3m4Jnekhc
         huK9lZVRv2jC3uX82kUe3bWw4Yn9R3ZIvGFkW086+8ZbCrzGmQjYBv6SYchSXnV4t48w
         bEHgSwT5NdA1d8mQTXDWq7QvuPGEl4H7E50EUrsmro60TpFnU+TXxEnMRBFBwx6f5wz0
         0/+7rZzg0ZzQmo30ZdN79+uGfWFtpXNU3VGzROGucEGKKX5UZcr0nyE+zYgPnBFhjf9s
         yz6A==
X-Forwarded-Encrypted: i=1; AJvYcCWS0M71xgB4vexy6J549qlrpnZmffjU1qoTboO8u/3zOkXNTEhYXCu2djtHOFj5TakGd3U/M1Ngd9nqmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3PJiZd+rnhvh06jB9HLXjM8kwgEC8Jx0OGMva8cgRVRnKPVpX
	SX7vBgczybWd/jfZlBbu8Gj+5E8pyNl+4NHKAyLeDJwdFxWpK0XVrqjkU2nUiQfR0wfjaZLO8Y1
	DbOw1sgs3c/nWEDAmi3QCf8kdJ5OaMv8EcNs6eVxJdlP9Sq/2BRkTVlMVr6yW7xHEvA==
X-Gm-Gg: AY/fxX5mYC0VQyp4ZfAR7z6fkCegL2yWvuL0/Ui3ndTfWiL7q25Doo+PM/a5NpRgWNQ
	ALIzE23aQy85pTPPuyvfDx59mCP4t9AzfZ+eMcqQcoGVW+BI7VrppljCXh37gW0mWAAwVZQ2go7
	3VAMfuHmAyWxGDXE2Ne5Vp8Qrc4vRQUzq8fdVQlDUG3I1/V6U/UftE2lmBkSgHDT/JcsDMkQe1+
	dzyUBzGmqX8d6wNTNw7hrbroTMHFdPdc/RdUQ29RiONQBGmM6GRTfNt84zb7sFid6BFxQwf0sxx
	J2mw40g9O1+fwcRBgZ8LZ/F4jYlEmmFzbzL+FUZfOoYyBA5Ksdx5CNUZjGuD/Io3Bfhd+KocQal
	qGoXlGVpFvH5Y0owspee3/xCUwJaNNfhauGKZjwS9G5cDb6/NRZrK0xRccMkQj/MoAEg=
X-Received: by 2002:a05:620a:3186:b0:8c6:2539:dcda with SMTP id af79cd13be357-8c6ca3aa503mr254592485a.2.1768904431227;
        Tue, 20 Jan 2026 02:20:31 -0800 (PST)
X-Received: by 2002:a05:620a:3186:b0:8c6:2539:dcda with SMTP id af79cd13be357-8c6ca3aa503mr254590285a.2.1768904430752;
        Tue, 20 Jan 2026 02:20:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a192b6sm1354598566b.59.2026.01.20.02.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:20:29 -0800 (PST)
Message-ID: <c0d1c780-b90f-49f2-8cd8-e7e2f2e24752@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 11:20:27 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Correct
 uart instances
To: petr.hodina@protonmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com>
 <20260119-akatsuki-uart-v1-1-238f4da4fa56@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-akatsuki-uart-v1-1-238f4da4fa56@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nF8Pme022ObAYIr_gKjVZt97b5E-RelT
X-Authority-Analysis: v=2.4 cv=drTWylg4 c=1 sm=1 tr=0 ts=696f56f0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8
 a=2ih4SPTeAa9FiNVnbewA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: nF8Pme022ObAYIr_gKjVZt97b5E-RelT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NiBTYWx0ZWRfX17Rj7GMP8RVX
 mJoD2NWWdWh44H0utg4XHShGWikd5ymNRx325fyYnckdNXycbQglgZ4BY8lAgicUv6vSehZLwDF
 cMwINr32rvjkZ757UddS8ip8g+ymv4Wbb0Uv1NItsxc8R551Hpuk5SV+s4q/XyQ8PcDfIqkxxc+
 EIVDfFSIM86AcvuCo1busCAq9mpDdT8533dHAaM9Z8jOJJa0bYlWSvmOHpncj62mWc1lxDBYURU
 qX7jTDVYayCVdfDEzZ1Qr+094s7+304fxzMcluabRuYUbM9NIUJBnLOYIsFWKMWgu+cqxZN56/A
 YSBcYrXyLryXvqNxEdnqu4QjJbeUxGhMzCJht8Ui+XPovL+m/pf6Pjp9YfqzDGk6PmURt7JfNAK
 3E15ztB1d7G7YWQ7JgA/gxiquXCnuoLJhO7s/bMg7A/EngoOXOizZzmUttl1yFrWuQMWC8fzSsH
 8hBzgIGy5lWtmqZs3xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200086

On 1/19/26 12:58 PM, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Change the uart instances:
> - uart6 is for bluetooth
> - uart9 is for serial console (available on the uSD pinout)
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---

It would make sense to add a note why this is a useful change (i.e.
most OSes would probably assume serial0 is the console UART and
sending that to the bluetooth chip is no good)

With that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

