Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC743D7A16
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 12:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551461; cv=none; b=e+l22EDFp+G1vcPRtmShGNtIuJ+mLXj0BUvT2KbMLSr7T1XGwUYMEZQ4wnr6iQJoX3F68qIukE/9JICQRju4GwYO5dgY7oTsWllzy8JXXDIHAT4SaWVcyGlDwiHCAlMpjpqC7QB9sFnTl2es19JL+RIg6dAp8oI71ZcZTbVWJMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551461; c=relaxed/simple;
	bh=3X361OghhtBCXDWYCpLJUBdhn2g2fYZkq5H1o5WSijg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZKvg3apvXWOmmcCK23MbGlgghQ5oeBN8ywfsWaxn+cPp8MOTsjkiKgtLag8hsUXzpXjLyJH/IRMeCYVFoFhlCTZFAFXEyTDN4hiA2ZWzok7Lq8OWHfqza1kNaMSqg5ZnFl8STP9Z7crb40WY8JgMz3LHYG5topTbZT+GIq4aFIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLohWoVN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLohWoVN"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f71156e1aso681073f8f.3
        for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784551457; x=1785156257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMa/0BGsdYcQi2e35BFsO4OaVqHoZxkJxGW0UmfwEps=;
        b=mLohWoVN8i6V6mRpIQLiWJ7qhvFepIYhetsQVJ9mHYjwops2ur/2KuMduEFBzXggUa
         pRJPO8dkJEJUlwF24inHZNxY9dStPs4ZKTzp6GNEVJkfP/mf5g25ojJIOYB62UfDOgob
         42AqWOe2fNCAiDcl7Xcy99tE6zSeWFp+0gFkGNtdqnSgA4haXGUvscEdA/oc0KZxqQsc
         ED1fksH3EMSlrjWfB41kvkqP5JqX1OW1S7J0CcUxrUOR1Qir2zq41ermBusz6rF8gzl6
         qeGAL37tbi+z/t1LOVqB5gs1ex+od7Y1kVp440SyUwM5JWiXbHpSZ5F0UURvNuTWGXuH
         xk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784551457; x=1785156257;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kMa/0BGsdYcQi2e35BFsO4OaVqHoZxkJxGW0UmfwEps=;
        b=G7XyhZ0hgS2m7kAMh9V93KDN6VbAqQIbSp9fV80xuW/w6EMRPgHsnykA4NRMctjOzw
         t9VCYOO7sOoOOZXc905ueiUhYH8enI3+WI3wsS8QYckrbLw7GR44HWPP3CN9+5RMaTFe
         DFdQXY+nP0IRsAyB5/Xq7bugYweu+gGnsw5IqV16w8zDctdwbL9jxvJSgmAoF4DNxW7E
         XmN12vD6QS1HmJ3RzzfLbUPtMLx30DjGtySYXtwQdZ4tW9qN2SyRj92KIrfT4DlQopnA
         RkmmUPm0tqPX2DOCljNnZet9cJbqE57kH4Tmx6JARJD67kofo0OUc8P9Mxlhvz3ubMvf
         ZWQw==
X-Forwarded-Encrypted: i=1; AHgh+RqCI3/+cPv0DLY37nWaSR16eGEd/r5UHARWtN06BhRJxH/jYwaURlX1AoUucypXEGwoSEUchc7hFvCgYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhISfp4hS5aVpbTYkQzCv26qVrnzIYNhXAGkijvaEhKOsv0c9m
	jWV3RyArP7eKoHoUM4HG0BkRtFpWxxTQ25jZQ3rXIY63/BzHbmhbSoGuwh+KWBIhqx0L02cw8wX
	cT0oZjRg=
X-Gm-Gg: AfdE7cl8v2hoybZ/5YMbxkuPaRvqTxMj04PpbZjUXozxUWUPhr0BLJ0awQzOVswbDcO
	bJzkVWpxIyw9y/7rr8FV0/duqdl10UokaJJUaRLQTGdawCGPlcgjn7U+cAPOiA/ogpNbbtJJRAW
	JNM9b5kuTAQjPc8G6JP0Gp+i6wLHo4yNbbSlGALr0kSpjoL1ePwkECvtfBMIwkQ6+pvp33hWbLE
	cCa+t9wL/EP4PpJHTPkZ/ZlxcrH9+7ChT4eQ7ndePA2W3GTJPgXo+xeSrPeKCI/Wm85e2oEHorx
	W4gNVfroaaC2c/G4aP5D8B8E/2QDubJLMuvUZK/g2V1Dfmgg8sOgmA1qFt/D1mIYwmtLttItFW0
	ZHwJX0MGWqVcKQpHhlMdFzu5r7CbNuxcN847I7SPUjApZFA1nQ4/j5eC+275d93pz/6bBueEs/3
	TryXDrwhLesLoVBr/qM9/xwNqZ47kAbnjidF7+NLn02ehwfIz2b3tMwXxH8g==
X-Received: by 2002:a05:600c:1f82:b0:495:607e:5ee7 with SMTP id 5b1f17b1804b1-495607e635amr30152915e9.17.1784551457362;
        Mon, 20 Jul 2026 05:44:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:544a:2852:f257:ebc5? ([2a01:e0a:106d:1080:544a:2852:f257:ebc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499a5847sm201238965e9.2.2026.07.20.05.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 05:44:17 -0700 (PDT)
Message-ID: <276ab440-9907-4bec-81f0-54e9e8ba67b3@linaro.org>
Date: Mon, 20 Jul 2026 14:44:16 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: sofef00: Fix DSI transfer errors on backlight
 update
To: =?UTF-8?Q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, David Heidelberg
 <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260706051825.78752-1-cedric.bellegarde@adishatz.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260706051825.78752-1-cedric.bellegarde@adishatz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/6/26 07:18, Cédric Bellegarde wrote:
> Backlight updates via bl_update_status() could be triggered before the
> panel was fully initialized, resulting in failed DCS commands during
> the atomic commit sequence.
> 
> Guard bl_update_status() with a prepared flag to skip backlight updates
> when the panel is not yet ready.
> 
> [11816.846734] disp_cc_mdss_byte0_clk status stuck at 'on'
> [11816.846752] WARNING: CPU: 4 PID: 26399 at drivers/clk/qcom/clk-branch.c:88 clk_branch_toggle+0x128/0x178
> [11816.861715] Modules linked in: rfcomm rmnet algif_hash algif_skcipher q6asm_dai q6voice_dai q6routing q6afe_dai q6voice q6adm q6cvp q6afe q6asm q6mvm q6
> cvs q6voice_common snd_q6dsp_common q6core bnep gpio_wcd934x snd_soc_wcd934x snd_soc_wcd_mbhc soundwire_qcom snd_soc_wcd_classh venus_enc venus_dec imx371 wcd9
> 34x regmap_slimbus imx376 lc898217xc videobuf2_dma_contig fastrpc v4l2_cci qrtr_smd rpmsg_ctrl hci_uart btqca btbcm bluetooth ecdh_generic ecc pwrseq_core snd_
> soc_max98927 qcom_camss ath10k_snoc videobuf2_dma_sg snd_soc_sdm845 videobuf2_memops venus_core ath10k_core qcom_smbx leds_qcom_flash snd_soc_rt5663 leds_qcom_
> lpg ath v4l2_mem2mem snd_soc_qcom_sdw videobuf2_v4l2 v4l2_fwnode videobuf2_common v4l2_async snd_soc_qcom_common bq27xxx_battery_i2c qcom_pbs bq27xxx_battery l
> ed_class_multicolor mac80211 snd_soc_rl6231 rtc_pm8xxx libarc4 soundwire_bus videodev qcom_stats qcom_spmi_rradc reset_qcom_pdc i2c_qcom_cci cfg80211 camcc_sdm
> 845 rfkill mc qcom_rng ipa qcom_q6v5_mss slim_qcom_ngd_ctrl qcom_wdt icc_bwmon qrtr
> [11816.861812]  qcom_q6v5_pas qcom_pil_info qcom_q6v5 qcom_sysmon qcom_common qcom_glink_smem joydev zram zsmalloc uhid uinput nft_reject_inet nft_reject n
> f_reject_ipv6 nf_reject_ipv4 nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables fuse nfnetlink ipv6 qcom_spmi_haptics rmi_i2c rmi_core
> [11816.978965] CPU: 4 UID: 0 PID: 26399 Comm: (sd-bright) Tainted: G        W           6.16.7-sdm845 #1000-postmarketos-qcom-sdm845 PREEMPT
> [11816.991580] Tainted: [W]=WARN
> [11816.994637] Hardware name: OnePlus 6 (DT)
> [11816.998735] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [11817.005844] pc : clk_branch_toggle+0x128/0x178
> [11817.010384] lr : clk_branch_toggle+0x124/0x178
> [11817.014956] sp : ffff8000991f3970
> [11817.018358] x29: ffff8000991f3980 x28: ffff0000dad38000 x27: 0000000000000000
> [11817.025634] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
> [11817.032887] x23: 0000000000000000 x22: ffffa63e2af42178 x21: ffffa63e2b56e128
> [11817.040169] x20: ffffa63e29da5a90 x19: 0000000000000000 x18: 0000000000000003
> [11817.047451] x17: 0000000000000000 x16: 000000000000000c x15: 0000000000000003
> [11817.054701] x14: ffffa63e2b2f6a10 x13: 0000000000000003 x12: 0000000000000003
> [11817.061982] x11: 00000000ffffefff x10: c0000000ffffefff x9 : e43cc05c4996c100
> [11817.069260] x8 : e43cc05c4996c100 x7 : 7461206b63757473 x6 : 0000000000000027
> [11817.076511] x5 : ffffa63e2b8726d3 x4 : ffffa63e2ae146c4 x3 : 0000000000000000
> [11817.083792] x2 : 0000000000000000 x1 : ffff8000991f3710 x0 : 00000000fffffff0
> [11817.091042] Call trace:
> [11817.093572]  clk_branch_toggle+0x128/0x178 (P)
> [11817.098112]  clk_branch2_disable+0x28/0x40
> [11817.102308]  clk_core_disable+0x64/0x1b8
> [11817.106358]  clk_core_disable_lock+0x90/0x120
> [11817.110810]  clk_disable+0x2c/0x40
> [11817.114298]  dsi_link_clk_disable_6g+0x78/0x98
> [11817.118871]  msm_dsi_host_xfer_restore+0xf0/0x120
> [11817.123667]  msm_dsi_manager_cmd_xfer+0xfc/0x178
> [11817.128411]  dsi_host_transfer+0x48/0x110
> [11817.132509]  mipi_dsi_dcs_set_display_brightness_large+0x8c/0xd0
> [11817.138651]  sofef00_panel_bl_update_status+0x3c/0x60
> [11817.143802]  backlight_device_set_brightness+0x88/0x128
> [11817.149124]  brightness_store+0x64/0xa8
> [11817.153082]  dev_attr_store+0x24/0x40
> [11817.156835]  sysfs_kf_write+0x8c/0xb8
> [11817.160591]  kernfs_fop_write_iter+0xe4/0x190
> [11817.165073]  do_iter_readv_writev+0x168/0x1c8
> [11817.169515]  vfs_writev+0x16c/0x378
> [11817.173122]  do_writev+0x84/0x130
> [11817.176523]  __arm64_sys_writev+0x2c/0x40
> [11817.180618]  invoke_syscall+0x48/0x100
> [11817.184460]  el0_svc_common+0x88/0xe8
> [11817.188217]  do_el0_svc+0x28/0x40
> [11817.191621]  el0_svc+0x38/0x88
> [11817.194766]  el0t_64_sync_handler+0x78/0x108
> [11817.199161]  el0t_64_sync+0x198/0x1a0
> 
> Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
> ---
>   drivers/gpu/drm/panel/panel-samsung-sofef00.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> index e00a497a7c96..f07d6533ed69 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> @@ -175,9 +175,13 @@ static const struct drm_panel_funcs sofef00_panel_panel_funcs = {
>   static int sofef00_panel_bl_update_status(struct backlight_device *bl)
>   {
>   	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	struct sofef00_panel *ctx = mipi_dsi_get_drvdata(dsi);
>   	int err;
>   	u16 brightness = (u16)backlight_get_brightness(bl);
>   
> +	if (!ctx->panel.prepared)
> +		return 0;
> +
>   	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>   
>   	err = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
