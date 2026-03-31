Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037203E1CFA
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973201; cv=none; b=NJ46Tn/i++8Z9Db3ug5/ZZWoPa8OdoxKOdmIe6f8jw1I+2i7MWOAzLz5BqGgY0mF570FID5CyQSxLpKI3a/2unoJ9JWVRR8NJvOX5T6NDbX8sQgdLESdGyy04vpvr07dBLLU3u+VaAxcziihgd0O3Um8XgzYvwWZRzMsWIT+fB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973201; c=relaxed/simple;
	bh=pi0dDbHJXEJVbZJ6ZG5ypkoytcd3rnY23wb7RUCjHYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uj5lErk/2YOGl0xPOWicHZwNguSwshRr0iEYRrmFwY/b1d2ps6uR6V/DEuvBaZJ+/fat6y8A73f5I0A4KU5UuyCyq5ctXws2jKLhwpRb9qY1DqD8FH6wJgY4z0y5/VKzxJ7DZoBcW1M8nH1l/S4hGCbV8tRS2LU0lO4cygPxYVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anS9yjmU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ib8uqUBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anS9yjmU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ib8uqUBa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VDo5A4430980
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 16:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pSWb3pTaeY95vdPxjX7UY7rGaPSlAV+QyyhLsGlJC9U=; b=anS9yjmUXJ5FvfR4
	6JeklTNPPU5LPXvy3e3FMSrPqN9si7uIUzTuBAMNeK40EZSeR/Z/0ajVMn+ioIWE
	PjSAePKV5018ajkbs+LMRLuudMch+v7uWIFchBf74zrymrStIqCRqc+wj/F7VH0V
	5j3yVgKltiFxio1cxRX0iifjFEdZ7ZOnZdlkSb7j7XJg3W/4Ns9dNcQ8T/xf45PM
	3/JhFFKV2dU3qr60NR5wgzuvtgGq5aOaI8zlD6+DN9HoXDl/x4ajnlgugx0AHS/l
	EJdEw0ZkSbL3cdJ7UBBzYrTbleWZbDE6n7Tl6U033LpsIXxQlTR9l9cBL5SvmXBY
	iaWmhQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfkewj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 16:06:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso6825826a91.2
        for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774973198; x=1775577998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pSWb3pTaeY95vdPxjX7UY7rGaPSlAV+QyyhLsGlJC9U=;
        b=Ib8uqUBaQ2+k/XEHrunDHa/hYfkGcHLYTZVblVy5UHc0muJLIDaBivFjzlhM5ZheX8
         GcMqyvaHKiUI+C2lbHmExRju9EvuuDwUm7ArmmmV/RY7hq59S8SmxSCRY6ZmwoVG1qYj
         lngS/N9tSl8lae8B7M1JEZKlerJtlODf47ldt1MDnQPX7XHxS5usGsNQa66dDeWEKrwI
         JQKeN9vRQR+jnMSurYrF9u1n5Jaeh1dAFZnGQovWe+OcMxzFE1dMf4j1l5afsYDvgY3L
         /07sKshHi3rU5dvzyp4snwP3vJgte9NQzg0p8OscK39CRXqorZmErAQF4FoM+F1ROttc
         ZefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973198; x=1775577998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSWb3pTaeY95vdPxjX7UY7rGaPSlAV+QyyhLsGlJC9U=;
        b=bTQeu0Q7EXY42uGpoXdr4Vlb4nHP02nyiTGP0s+Hm7PtKJD9l9y9GSrOrEcWBwa7X+
         KwVdWJrJ315pVDSZDNvYydSRSFI33grtrPZrLBoYcAWS+91HoSGkpnocLBOtsfm1DrO5
         w/o/zt4czjzSWSgI3S/dV5/kXPN2nm4flX1VcCo3pi7Ge0SK4zrsiPhFCq6AkTuiK6D8
         QrkGuJoktCCb8Eiwx/MaNznhHRVCuWe+hRnyXim7yfS7mqpRq94j+KdR3D8oZ+MY65f7
         eAtQ6kr3GFGRRjZUsDTr20JAIWVplDK0cSdGFJz1YPJBti9uufkTk/v99D3EIDfhOb2i
         VaZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGEfAjPS9SPkLtGh0sajYLyGBFOKTH8BEjGUPmt+Sa0uIkM0SoBh4o1cdEVK1Q1OENAy068H5f5movtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaqBkJB6L+uerBIE846it+8lJCt33kZOimGxZHBjIJzPEVewhx
	QF2VpHso8m1LFVeGMnWxAd8fmdfAZmBpznnGhs0EPiMEKdQRQRUvTKfGb64kPhOpGax8pYC8fSn
	UIWl8s2e3dAzkgDE5bYAp+oSTOqBngDy58ZVY9CHolFkGcuxsv0KuNmJ2hoPKi4tFWw==
X-Gm-Gg: ATEYQzxPgQ2ibEQMR/e0/+M3VNJj2OA9unpiFwylGy9kMxscY/oUEf66JOeRPmUzNPd
	zgs7jpxN0kq0gB3NlKMAOPssMZm6qbPPojhCoO242KWVc2tZyMr3ADfDNsV7ZWi5KcOi+bNNdty
	NR6LS+bUd0BM6WVJl0/yTXUcfcwl695G5hnu88hqDKdF0Y4RnHMlNBPYFa9lrna4oRYQGEbsQ0t
	mWRntypSRyOv9AjgfpwYAMndYbqqJ6HAMDuLdn4oyAsg+HZ8kaF+c0Qtp6YZpaREyRHSHYPX0K5
	+1DT63tDBGeOolKxmdXEPG8QtIdyeAxAQLfwchyvhxJOupgn81wFBCkp7jCBUPxaTeTE4RlDX4I
	iDVP+/MBQi8GA7JCTxyNcEyL700VcMhBnnyQ3tKK90hiSj55od+23OfZs0iDO3tQFv5cVnpdW
X-Received: by 2002:a17:90a:d404:b0:35d:9d6b:9d8a with SMTP id 98e67ed59e1d1-35d9d6b9fbemr9871487a91.15.1774973197868;
        Tue, 31 Mar 2026 09:06:37 -0700 (PDT)
X-Received: by 2002:a17:90a:d404:b0:35d:9d6b:9d8a with SMTP id 98e67ed59e1d1-35d9d6b9fbemr9871430a91.15.1774973197319;
        Tue, 31 Mar 2026 09:06:37 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.193.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe66f7b7sm2094541a91.10.2026.03.31.09.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 09:06:36 -0700 (PDT)
Message-ID: <1dc85067-df11-4236-bfdc-e2117da493c9@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 21:36:28 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap QMI
 requests
To: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cbf10e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fHzH9zTiDFanLkNeTzv53w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jr6ivFuIO4VC9FIHmAQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1NCBTYWx0ZWRfXwrAEWNMfd6/P
 Tp/3idHpKhnVL/S3JzOO1o7/a2XmF3WRRs2pWY+mPaqnEsRJbrU4ITSAmFE9PNeZZEOY5bGFsqO
 Srq2WHG4wsaAeFqzxSMULIZ/aNpzGWBrpNl31mKw92uCEP0y+Ldiak1+1K8L9P7mH8pXWakHmn/
 lhYhcHOxILhvdAXchh1VrlDq/xeYVelJnoQ0DbLleJBRnPqPNgHYBt7uCMI7m/mUcFW5IjwQ4hD
 SAFGKXAqSqJk+0JB8ulHbw8Vcq7gCTwTavScZsNF7T0NXL3osi8ot/nSt/E4rD1Vfgg/KtxT8ln
 XjJHe6C0AKVFtNRFurglOZdwnxhfolCL8LD9jh1h9trWpTJMikOKPWFl50szw0VlHqrBdkz02zz
 idIiK1iEj88acKhZtu31MhIVBeDJ7fHElEFsHGTMgJz//ELoQD8d9n9uU3mSyzggYIr3/ZGz6+E
 thtthfa9x8jtdqhDYIA==
X-Proofpoint-GUID: P3alICs766PqTuRbhtQAu4VgQ8QxDKjP
X-Proofpoint-ORIG-GUID: P3alICs766PqTuRbhtQAu4VgQ8QxDKjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310154



On 3/25/2026 11:27 PM, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Some firmware versions do not support the host capability QMI request.
> Since this request occurs before firmware-N.bin and board-M.bin are
> loaded, the quirk cannot be expressed in the firmware itself.
> 
> The root cause is unclear, but there appears to be a generation of
> firmware that lacks host capability support.
> 
> Without this quirk, ath10k_qmi_host_cap_send_sync() returns
> QMI_ERR_MALFORMED_MSG_V01 before loading the firmware. This error is not
> fatal - Wi-Fi services still come up successfully if the request is simply
> skipped.
> 
> Add a device-tree quirk to skip the host capability QMI request on devices
> whose firmware does not support it.
> 
> For example, firmware build
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> on Xiaomi Poco F1 phone requires this quirk.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
