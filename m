Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B77834DB74
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 03:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533011; cv=none; b=EEZAyx5aralIYRngLZT2Ii5L/ieBqpcZI7pEoZW8YwwrZJx3/XpW7SbcLZw47jawePMAaMxa5i4m8nhU+YcfZmJphh5KtY4CVV+9fG8zebYEnQAQINKoLZMFIJH7VoTQbg32S+I58O28Sa4hoOl7WOCe4s9iO9Klxxd04c/ptKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533011; c=relaxed/simple;
	bh=z391g2w7sv7AiQbBUH5trzn6m5Ncr8wOxsHwKHgxfM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+eIuzLlQVll+9ZixMjaxsUKW4wHKn65mdSuFWkO/McZ1w202XTL2TjTicpyJWhQvzoMN6ISZvoHCIO2t0XtAPLKtIEXwNNm26sqdr+mQO6Cn2rOSY95HWetsMEhe0i8Zq7SKbl0CBseLGaOQFgYcxX2V27vsZ3h1+M7Kq/NQ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEuD2d4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxR8JWuX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEuD2d4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cxR8JWuX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LSDRI2009900
	for <phone-devel@vger.kernel.org>; Tue, 7 Apr 2026 03:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NUqWdraFh569ddUKgSTTw8gCNpVCYPxYTZ+d/rwHnwM=; b=DEuD2d4MzKHmn+xD
	dG3A3/CrH2hUhrmOnJbDHoeMEsmSM02VNSOtgNA59pPT7xXC+KLkWTKZbX8gZ9kC
	amCBzA9hywFTYih1deDl3RF1jEHc5AD5kg2hblAdto9xFMdNeTia/qYJjJc0TsOv
	0PpiEUnC7chhmwrSTCkiejEpz5AL4JTyNno7K1umFMriM2LKs1P4MyinxC/FBsi1
	i1Sy8YM8ihnXU65sx3tbLlQ2VNFHXZ8MyU0KkOsy3OKjyHqNCaLL2C3AR05xHN9e
	UviZRu/HTTeEWsusWmCBEK/TETddsgK4YytsY2RQjqcne5G55T1Tw0oYatoBaMOH
	fqtH7w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrruca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 03:36:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76dbf0fad3so1485254a12.1
        for <phone-devel@vger.kernel.org>; Mon, 06 Apr 2026 20:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775533008; x=1776137808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUqWdraFh569ddUKgSTTw8gCNpVCYPxYTZ+d/rwHnwM=;
        b=cxR8JWuXPlc5FE/pUjumNtxP59IuJpsm1ZSF3wHx9az4VHwewijXAVG0vIgBpZoYnB
         ILp705+SKEw+y1rfDOrtqX+bgPigmUCE/4NthC11UcSdCq1EyTHTGdoLO1NLZdFJZgeH
         JkKrW27l0AVOMwx9wLMDPoyHMZChQSTy3d1VGSskOoknWdQakcIInK/dllbgYyPfKUUK
         7UlHJQH683bpodFkdlkwzXWqf8L/po62RVGI6cxAUIHUyy+uZGQ6HsCVsTlMe5X3QJyX
         7SF200c8jDjFSZB8v0u9X+H+OEx7tJ/KRER0eNVuXznTz4AKNXlg1JD2wniCuPcTfpO9
         OJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775533008; x=1776137808;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUqWdraFh569ddUKgSTTw8gCNpVCYPxYTZ+d/rwHnwM=;
        b=BGhP87xq1gNhhC9WIrTqUeio0ZCmnd2vN3kFBwBkTgvScx52CqpaHeST9W/vBG4KrB
         IieZDf5LYgqWTagUk6sUYaa8YxGETPThDGcFn8/UGTcxkzTxDa8s4p3uQeFOzPMobUDS
         wkUuWdYwAzSSsqIg0iTpLHn5cffSUgo8ldTSzvgMm1hUMN5E/SSnG0xX2LMmaHCi8Kty
         a26Cj0AFjt0wh3YPkjfNp42wXw82IaiivMAjVlNULOPhvuqFo7KI0nlrSIOddoqljxAH
         Fz9rmStLmVRmeAxeBUzhKz0mUUMqyqIFNRvnYlMqID5p76uzGPtIYz4wne0Swe9DTC99
         uP4w==
X-Forwarded-Encrypted: i=1; AJvYcCXoEppyKE8nBrq8Ydpz0u7PIn9qvmMwx8DgGOknMgIKQS2QS0Uddj7SliSVVSrDR8BdM28Zs0FT24+uBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhrZp8+kUZS7KT7jvyiOCISNgdh1h5xxaYaDlHjgm42T7lgIiR
	cM5HL+mjzW8xsI5HJKOi/lP6P2wm0YjfxfU0+NGMiHFgAP/JrD2/RWZ4KxRdnPA/qi0WVmsIfeD
	DFIksApMfHUE8auCkzzkY34ndq7B1oQINv/qafjpANyCTApr6VDD0BIHyXQKc2Ht5Bg==
X-Gm-Gg: AeBDiesDhip/KG5elGFNWQOmvFViKuvxDOFE9ukQxvHWjr1vxhYU1OdQW1q9bJOa7zL
	TBeiI6FnbCXgI2EUqpzEz1Y29q9DDopXJ1E4LGYgPIlFfoXxnb5icmn6a1Caau9zYqsW9zhXcXm
	O0OfRP0OTR0XoZfZ9MhbP7nHvW/eqVbvA5QM7gpsCU79A79EgHYYixOlNKWrKzVRL3MvEXesEdB
	lzKvZjwNO7w0dfEuJZNWcr8ApxCDRjevHgooZEeY7iGH8p1Z345VDA3HzJgQxX/1x5Ws7TfJNKq
	HNrm4JLClrRdoKeJeKs+W/u1JJGTD21t6rxrimmJHSwB84lBrcewnecjlZx5twzhLXnKOVkEOXr
	W27uiqj6RXNXbnS0hMCg5ISJVqcz8qQtOKvE+L93pvmkvKI6SadC7i2kTe1rnvENEV2OV9XK5AW
	SQczrg/uDtpu+Ntkhws58=
X-Received: by 2002:a05:6a00:1805:b0:82a:1380:417d with SMTP id d2e1a72fcca58-82d0dbcfad1mr14887007b3a.52.1775533008195;
        Mon, 06 Apr 2026 20:36:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:1805:b0:82a:1380:417d with SMTP id d2e1a72fcca58-82d0dbcfad1mr14886973b3a.52.1775533007669;
        Mon, 06 Apr 2026 20:36:47 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm14351181b3a.23.2026.04.06.20.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 20:36:47 -0700 (PDT)
Message-ID: <f970b6ab-63ed-48f9-a49d-06c172656379@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:36:42 +0800
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
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAzMSBTYWx0ZWRfX2FETCxjCgxW8
 bxuVQkJMPUTvFRPdKJcobTZZny6oNKV1QL9dOgcfAppfEbk4ZRiQv6joZYW8W5bapUOilvEDZi6
 WQh1LTgL397W7aSduYLIZ9lcmL+8cCcTDGxgQnKkCTAUvCt/ltD9C5Ji9OFkjzvi3P+JR/VMiCd
 Bxpx0rEOyib2XwsTVhNuwUcXoCZLRZwvrbyJ61cNYPOFZX2VZHRMwULmWicd9z3wF+wPRYRPGfS
 VwCfaRq8YQZCstHr1vYpNeDCRMopQdB/TeJcHJlxirfEhzep5J6968RIfaaHdh2pbC+eJzxpRcJ
 lpByZ+tdMVSLQiwOaNqduwqB78n22ptCA+0TM8WI+KtmrmE/WkjG79tAZ+gtB/zSb2K927MNcWh
 mPoMyJ4bD+xQDPXdAfDw+/6ZpUnlgslF6bPmg26U0L/qKDQsGZ00mLK0dHISEGoGEduz+hxnXSK
 RT7xm15UPjzJZ8e6HGA==
X-Proofpoint-GUID: SSrhtmTbbQ5c4F6giBu_d07KLnwBWnHi
X-Proofpoint-ORIG-GUID: SSrhtmTbbQ5c4F6giBu_d07KLnwBWnHi
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d47bd1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hFweg1R52QcHjneruXIA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070031



On 3/26/2026 1:57 AM, David Heidelberg via B4 Relay wrote:
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
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
>  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
>  drivers/net/wireless/ath/ath10k/snoc.h |  1 +
>  3 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index eebd78e7ff6bc..e7f90fd9e9b83 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -808,6 +808,7 @@ ath10k_qmi_ind_register_send_sync_msg(struct ath10k_qmi *qmi)
>  static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
>  {
>  	struct ath10k *ar = qmi->ar;
> +	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
>  	int ret;
>  
>  	ret = ath10k_qmi_ind_register_send_sync_msg(qmi);
> @@ -819,9 +820,15 @@ static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
>  		return;
>  	}
>  
> -	ret = ath10k_qmi_host_cap_send_sync(qmi);
> -	if (ret)
> -		return;
> +	/*
> +	 * Skip the host capability request for the firmware versions which
> +	 * do not support this feature.
> +	 */
> +	if (!test_bit(ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK, &ar_snoc->flags)) {
> +		ret = ath10k_qmi_host_cap_send_sync(qmi);
> +		if (ret)
> +			return;
> +	}
>  
>  	ret = ath10k_qmi_msa_mem_info_send_sync_msg(qmi);
>  	if (ret)
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index f72f236fb9eb3..3106502275781 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1362,6 +1362,9 @@ static void ath10k_snoc_quirks_init(struct ath10k *ar)
>  
>  	if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-8bit-quirk"))
>  		set_bit(ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK, &ar_snoc->flags);
> +
> +	if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-skip-quirk"))
> +		set_bit(ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK, &ar_snoc->flags);
>  }
>  
>  int ath10k_snoc_fw_indication(struct ath10k *ar, u64 type)
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
> index 1ecae34687c21..46574fd8f84ee 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.h
> +++ b/drivers/net/wireless/ath/ath10k/snoc.h
> @@ -51,6 +51,7 @@ enum ath10k_snoc_flags {
>  	ATH10K_SNOC_FLAG_MODEM_STOPPED,
>  	ATH10K_SNOC_FLAG_RECOVERY,
>  	ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK,
> +	ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK,
>  };
>  
>  struct clk_bulk_data;
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

